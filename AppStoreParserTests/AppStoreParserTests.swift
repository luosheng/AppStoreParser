//
//  AppStoreParserTests.swift
//  AppStoreParserTests
//
//  Created by Luo Sheng on 15/10/12.
//  Copyright © 2015年 Pop Tap. All rights reserved.
//

import XCTest
@testable import AppStoreParser

class AppStoreParserTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFetchAndParse() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = self.expectationWithDescription("App info is being fetched.")
        parseAppInfoForIdentifier("333206289") { (info, error) -> () in
            expectation.fulfill()
            if let info = info {
                XCTAssert(info.title != nil)
                XCTAssert(info.title!.containsString("支付宝"))
                XCTAssertEqual(info.iPhoneScreenshots.count, 4)
            }
        }
        self.waitForExpectationsWithTimeout(10, handler: nil)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
