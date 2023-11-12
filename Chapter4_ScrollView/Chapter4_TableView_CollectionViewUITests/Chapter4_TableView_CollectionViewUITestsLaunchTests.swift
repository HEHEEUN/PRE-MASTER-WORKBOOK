//
//  Chapter3_TableView_CollectionViewUITestsLaunchTests.swift
//  Chapter3_TableView_CollectionViewUITests
//
//  Created by 김희은 on 10/17/23.
//

import XCTest

final class Chapter4_TableView_CollectionViewUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
