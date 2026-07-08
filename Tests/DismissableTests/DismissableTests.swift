//
//  DismissableTests.swift
//  DismissableTests
//
//  Deterministic tests for the animator/interactor defaults and the
//  DismissableUsable threshold. These run headlessly on the simulator.
//

import XCTest
import UIKit
@testable import Dismissable

@MainActor
final class DismissableTests: XCTestCase {

    func testAnimatorDefaults() {
        let animator = DismissAnimator()
        XCTAssertEqual(animator.transitionDuration, 0.35, accuracy: 0.0001)
        XCTAssertEqual(animator.transitionDuration(using: nil), 0.35, accuracy: 0.0001)
    }

    func testAnimatorDefaultSingletonIsStable() {
        XCTAssertTrue(DismissAnimator.default === DismissAnimator.default)
    }

    func testInteractorStartsIdle() {
        let interactor = DismissInteractor()
        XCTAssertFalse(interactor.hasStarted)
        XCTAssertFalse(interactor.shouldFinish)
    }

    func testDismissableUsableDefaultThreshold() {
        let vc = SampleDismissableVC()
        XCTAssertEqual(vc.percentThreshold, 0.3, accuracy: 0.0001)
    }

    func testDismissTriggerUsableProvidesDefaults() {
        let vc = SampleTriggerVC()
        // Default extension hands back the shared instances.
        XCTAssertTrue(vc.dismissInteractor === DismissInteractor.default)
        XCTAssertTrue(vc.dismissAnimator === DismissAnimator.default)
    }
}

private final class SampleDismissableVC: UIViewController, DismissableUsable {}
private final class SampleTriggerVC: UIViewController, DismissTriggerUsable {}
