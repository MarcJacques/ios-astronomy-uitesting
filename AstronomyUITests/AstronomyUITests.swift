//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Marc Jacques on 10/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    // MARK: Properties
    
    let app = XCUIApplication()
    
   
    
    var saveButton: XCUIElement {
                    let button = app.buttons["PhotoDetailViewController.SaveButton"]
                    XCTAssertTrue(button.exists)
                    XCTAssertTrue(button.isHittable)
                    return button
                }


    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    app.launchArguments = ["UITesting"]
    app.launch()
    continueAfterFailure = false
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testSavingAPhoto() {
        let collectionView = app.collectionViews.firstMatch
        collectionView.cells.firstMatch.tap()
        saveButton.tap()
        
        if app.alerts["Photo Saved!"].exists {
            XCTAssertTrue(app.alerts["Photo Saved!"].exists)
            app.alerts["Photo Saved!"].buttons["Okay"].tap()
        }
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
