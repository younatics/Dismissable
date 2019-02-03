//
//  FlexibleAnimationController.swift
//  FlexibleViewController-Demo
//
//  Created by Seungyoun Yi on 03/02/2019.
//  Copyright © 2019 Seungyoun Yi. All rights reserved.
//

import UIKit

class FlexibleAnimationController:NSObject, UIViewControllerAnimatedTransitioning {
    private let originFrame: CGRect
    
    init(originFrame: CGRect) {
        self.originFrame = originFrame
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
    }
    
    
}
