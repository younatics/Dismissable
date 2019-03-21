//
//  DismissTriggerUIViewController.swift
//  Dismissable
//
//  Created by Seungyoun Yi on 06/02/2019.
//  Copyright © 2019 Seungyoun Yi. All rights reserved.
//

import UIKit

public typealias DismissTriggerViewController = (UIViewController & DismissTriggerUsable)

public protocol DismissTriggerUsable {
    var dismissInteractor: DismissInteractor { get }
    var dismissAnimator: DismissAnimator { get }
}

public extension DismissTriggerUsable {
    var dismissInteractor: DismissInteractor { return DismissInteractor.default }
    var dismissAnimator: DismissAnimator { return DismissAnimator.default }
}

final class DismissTriggerTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    private weak var rootViewController: DismissTriggerViewController?

    init(rootViewController: DismissTriggerViewController) {
        super.init()
        self.rootViewController = rootViewController
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return rootViewController?.dismissAnimator
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        guard let dismissInteractor = rootViewController?.dismissInteractor else { return nil }
        return dismissInteractor.hasStarted ? dismissInteractor : nil
    }
}
