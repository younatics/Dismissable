//
//  DismissableUIViewController.swift
//  Dismissable
//
//  Created by Seungyoun Yi on 06/02/2019.
//  Copyright © 2019 Seungyoun Yi. All rights reserved.
//

import UIKit

public typealias DismissableViewController = (UIViewController & DismissableUsable)

public protocol DismissableUsable {
    var percentThreshold: CGFloat { get }
}

public extension DismissableUsable {
    var percentThreshold: CGFloat { return 0.3 }
}

public extension DismissableUsable where Self: UIViewController {
    mutating func setup(_ dismissableVC: DismissTriggerViewController, scrollView: UIScrollView? = nil) {
        let dismissTriggerTransitioning = DismissTriggerTransitioningDelegate(rootViewController: dismissableVC)
        self.transitioningDelegate = dismissTriggerTransitioning
        self.dismissableTriggerTransitioning = dismissTriggerTransitioning
        self.dismissableInteractor = dismissableVC.dismissInteractor
        self.eventDispatcher = DismissableUsableEventDispatcher(rootViewController: self, scrollView: scrollView)
    }
}

final class DismissableUsableEventDispatcher: NSObject {
    private weak var rootViewController: DismissableViewController?
    private weak var scrollView: UIScrollView?
    private lazy var panGesture: UIPanGestureRecognizer = {
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(onPanGesture(_:)))
        gesture.delegate = self
        return gesture
    }()

    init(rootViewController: DismissableViewController, scrollView: UIScrollView? = nil) {
        super.init()
        
        self.rootViewController = rootViewController
        self.scrollView = scrollView
        rootViewController.view.addGestureRecognizer(self.panGesture)
    }
    
    // MARK: - Action
    @objc func onPanGesture(_ gesture: UIPanGestureRecognizer) {
        guard let rootViewController = rootViewController else { return }
        guard let interactor = rootViewController.dismissableInteractor else { return }
        
        switch gesture.state {
        case .began:
            interactor.hasStarted = true
            rootViewController.dismiss(animated: true, completion: nil)
        case .changed:
            let verticalMovement = Float(gesture.translation(in: rootViewController.view).y / rootViewController.view.bounds.height)
            let progress = CGFloat(fminf(fmaxf(verticalMovement, 0.0), 1.0))
            
            interactor.shouldFinish = progress > rootViewController.percentThreshold
            interactor.update(progress)
        case .cancelled:
            interactor.hasStarted = false
            interactor.cancel()
        case .ended:
            interactor.hasStarted = false
            interactor.shouldFinish
                ? interactor.finish()
                : interactor.cancel()
        default:
            break
        }
    }
}

extension DismissableUsableEventDispatcher: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        guard let contentOffsetY = scrollView?.contentOffset.y else { return true }
        if contentOffsetY > CGFloat(20) {
            return false
        }
        
        return true
    }
}
