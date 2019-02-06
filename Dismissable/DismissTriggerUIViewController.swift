//
//  DismissTriggerUIViewController.swift
//  Dismissable
//
//  Created by Seungyoun Yi on 06/02/2019.
//  Copyright © 2019 Seungyoun Yi. All rights reserved.
//

import UIKit

open class DismissTriggerUIViewController: UIViewController {
    public let dismissInteractor = DismissInteractor()
    public var dismissAnimator = DismissAnimator()
}

extension DismissTriggerUIViewController: UIViewControllerTransitioningDelegate {
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissAnimator
    }
    
    public func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return dismissInteractor.hasStarted ? dismissInteractor : nil
    }
}
