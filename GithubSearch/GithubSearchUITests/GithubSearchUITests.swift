//
//  GithubSearchUITests.swift
//  GithubSearchUITests
//
//  Created by Arthur Alvarez on 18/06/2018.
//  Copyright © 2018 Arthur Alvarez. All rights reserved.
//

import XCTest

class GithubSearchUITests: XCTestCase {

    var app = XCUIApplication()

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testUserSearch() {

        // Search for user
        let searchField = app.searchFields["Search users"]
        waitForElementToAppear(searchField)
        searchField.tap()
        searchField.typeText("ArthurAlvarez")
        app.buttons["Search"].tap()

        // Wait results to appear
        let table = app.tables.firstMatch
        waitForElementToAppear(table)

        // Assert result was found
        let username = table.staticTexts["UsernameLabel"].firstMatch
        XCTAssert(username.label.contains("ArthurAlvarez")) // Assert a valid result was found

        // Tap result
        username.tap()

        // Wait user repos to appear
        let repoName = table.staticTexts["nameLabel"].firstMatch
        waitForElementToAppear(repoName)

        // Assert value
        XCTAssert(repoName.label == "GithubSearch")
    }

    fileprivate func waitForElementToAppear(_ element: XCUIElement, timeout: TimeInterval = 30,  file: String = #file, line: UInt = #line) {
        let existsPredicate = NSPredicate(format: "exists == true")

        expectation(for: existsPredicate, evaluatedWith: element, handler: .none)

        waitForExpectations(timeout: timeout) { (error) -> Void in
            if error != nil {
                let message = "Failed to find \(element) after \(timeout) seconds."
                self.recordFailure(withDescription: message, inFile: file, atLine: Int(line), expected: true)
            }
        }
    }
}
