//
//  DismissAnimator.swift
//  Dismissable
//
//  Created by Seungyoun Yi on 06/02/2019.
//  Copyright © 2019 Seungyoun Yi. All rights reserved.
//

import UIKit

open class DismissAnimator : NSObject {
}

extension DismissAnimator : UIViewControllerAnimatedTransitioning {
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.35
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else { return }
        
        let dimmedView = UIView(frame: UIScreen.main.bounds)
        dimmedView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        toVC.view.addSubview(dimmedView)
        
        transitionContext.containerView.insertSubview(toVC.view, belowSubview: fromVC.view)
        
        let screenBounds = UIScreen.main.bounds
        let bottomLeftCorner = CGPoint(x: 0, y: screenBounds.height)
        let finalFrame = CGRect(origin: bottomLeftCorner, size: screenBounds.size)
        
        UIView.animate(
            withDuration: transitionDuration(using: transitionContext),
            animations: {
                dimmedView.backgroundColor = UIColor.black.withAlphaComponent(0)
                fromVC.view.frame = finalFrame
        },
            completion: { _ in
                dimmedView.removeFromSuperview()
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        )
    }
}
