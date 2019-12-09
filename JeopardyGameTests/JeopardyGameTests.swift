//
//  JeopardyGameTests.swift
//  JeopardyGameTests
//
//  Created by dirtbag on 12/4/19.
//  Copyright © 2019 dirtbag. All rights reserved.
//

import XCTest
@testable import JeopardyGame

class JeopardyGameTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCategoryParser() {
        let expectation = self.expectation(description: "Testing Categories Parser")
        
        let testBundle = Bundle(for: type(of: self))
        let filename = "categories"
        
        let path = testBundle.path(forResource: filename, ofType: "json")
        XCTAssertNotNil(path, "\(filename) file not found")
        
        guard let cleanPath = path else { return }
        
        // convert into URL
        let url = NSURL.fileURL(withPath: cleanPath)
        do {
            // load json into Data object
            let data = try Data(contentsOf: url)
            
            XCTAssertNotNil(data, "Data came back nil")
            
            let parser = CategoryParser()
            parser.parse(data: data) { (categories) in
                XCTAssertTrue(categories[0].title == "pair of dice, lost", "Unexpected Data returned")
                
                expectation.fulfill()
            }
        } catch {
            assertionFailure("Error: " + error.localizedDescription)
        }
        
        // 15 second wait for timeout
        waitForExpectations(timeout: 15, handler: nil)
    }

    func testCluesParser() {
        let expectation = self.expectation(description: "Testing Clues Parser")

        let testBundle = Bundle(for: type(of: self))
        let filename = "clues"
        
        let path = testBundle.path(forResource: filename, ofType: "json")
        XCTAssertNotNil(path, "\(filename) file not found")
        
        guard let cleanPath = path else { return }
        
        // convert into URL
        let url = NSURL.fileURL(withPath: cleanPath)
        do {
            // load json into Data object
            let data = try Data(contentsOf: url)
            
            XCTAssertNotNil(data, "\(filename) Data came back nil")
            
            let parser = ClueParser()
            parser.parse(data: data) { (clues) in
                
                XCTAssertTrue(clues[0].answer == "the Western division", "Unexpected Data returned")
                
                expectation.fulfill()
            }
        } catch {
            assertionFailure("Error: " + error.localizedDescription)
        }
        
        // 15 second wait for timeout
        waitForExpectations(timeout: 15, handler: nil)
    }
}
