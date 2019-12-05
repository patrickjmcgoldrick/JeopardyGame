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
        let testBundle = Bundle(for: type(of: self))
        let path = testBundle.path(forResource: "catatories", ofType: "json")

        XCTAssertNotNil(path, "Roster_Workforce file not found")
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
            }
        } catch {
            assertionFailure("Error: " + error.localizedDescription)
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
