//
//  UIViewController+Dismissable.swift
//  Dismissable
//
//  Created by Taeun Kim on 08/02/2019.
//  Copyright © 2019 Seungyoun Yi. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    enum AssociatedKeys {
        static var eventDispatcher = "eventDispatcher"
        static var dismissableTriggerTransitioning = "dismissableTriggerTransitioning"
        static var dismissableInteractor = "dismissableInteractor"
    }
    
    var eventDispatcher: DismissableUsableEventDispatcher? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.eventDispatcher) as? DismissableUsableEventDispatcher }
        set { objc_setAssociatedObject(self, &AssociatedKeys.eventDispatcher, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    var dismissableTriggerTransitioning: DismissTriggerTransitioningDelegate? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.dismissableTriggerTransitioning) as? DismissTriggerTransitioningDelegate }
        set { objc_setAssociatedObject(self, &AssociatedKeys.dismissableTriggerTransitioning, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    var dismissableInteractor: DismissInteractor? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.dismissableInteractor) as? DismissInteractor }
        set { objc_setAssociatedObject(self, &AssociatedKeys.dismissableInteractor, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
}
