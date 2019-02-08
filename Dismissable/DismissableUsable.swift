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
    
    mutating func setup(dismissable: (vc: DismissTriggerViewController, dismissInteractor: DismissInteractor)) {
        let dismissTriggerTransitioning = DismissTriggerTransitioningDelegate(rootViewController: dismissable.vc)
        self.transitioningDelegate = dismissTriggerTransitioning
        self.dismissableTriggerTransitioning = dismissTriggerTransitioning
        self.dismissableInteractor = dismissable.dismissInteractor
        self.eventDispatcher = DismissableUsableEventDispatcher(rootViewController: self)
    }
    
}

final class DismissableUsableEventDispatcher: NSObject, UIGestureRecognizerDelegate {
    
    private weak var rootViewController: DismissableViewController?
    private lazy var panGesture: UIPanGestureRecognizer = {
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(onPanGesture(_:)))
        gesture.delegate = self
        return gesture
    }()

    init(rootViewController: DismissableViewController) {
        super.init()
        self.rootViewController = rootViewController
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
    
    // MARK: - UIGestureRecognizerDelegate
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
