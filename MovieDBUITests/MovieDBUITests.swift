//
//  MovieDBUITests.swift
//  MovieDBUITests
//
//  Created by Toan Pham on 5/23/22.
//

import XCTest

class MovieDBUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInfiniteScroll(){
        let app = XCUIApplication()
        app.launch()
        
        var newCell = app.tables.cells.containing(.staticText, identifier:"Morbius").element
        XCTAssertTrue(newCell.exists)
        
        app.swipeUp()
        newCell = app.tables.cells.containing(.staticText, identifier:"The Contractor").element
        XCTAssertTrue(newCell.exists)
        
        app.swipeUp()
        app.swipeUp()
        newCell = app.tables.cells.containing(.staticText, identifier:"The Grandmother").element
    }

}
