//
//  MyBrainTest.swift
//  Calculator
//
//  Created by Bradley Miller on 2/15/16.
//  Copyright © 2016 Bradley Miller. All rights reserved.
//

import XCTest
@testable import Calculator

class MyBrainTest: XCTestCase {
    var brain = CalculatorBrain()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(brain.pushOperand(2), 2.0)
        XCTAssertEqual(brain.pushOperand(3), 3.0)
        XCTAssertEqual(brain.performOperation("×"), 6.0)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}