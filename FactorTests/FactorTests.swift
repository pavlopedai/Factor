//
//  FactorTests.swift
//  FactorTests
//
//  Created by Pavlo Pedai on 10/12/19.
//  Copyright © 2019 Pavlo Pedai. All rights reserved.
//

import XCTest
@testable import Factor

class FactorTests: XCTestCase {
    private var performanceTestValue = 555555555555
    private var testDataSuite = ["3": "[3]",
                                 "45": "[3, 3, 5]",
                                 "210": "[2, 3, 5, 7]",
                                 "256": "[2, 2, 2, 2, 2, 2, 2, 2]",
                                 "555555555555": "[3, 5, 7, 11, 13, 37, 101, 9901]"]
    func testRecursive() {
        for item in testDataSuite.enumerated() {
            let result = Factor.factorRecursive(value: Int(item.element.key)!)
            XCTAssertEqual(item.element.value, "\(result)", "Incorrect output for value: \(item.element.key). Expected: \(item.element.value). Actual: \(result)")
        }
    }

    func testRegular() {
        for item in testDataSuite.enumerated() {
            let result = Factor.factorRegular(value: Int(item.element.key)!)
            XCTAssertEqual(item.element.value, "\(result)", "Incorrect output for value: \(item.element.key). Expected: \(item.element.value). Actual: \(result)")
        }
    }
    
    func testRecursivePerformance() {
        self.measure {
            _ = Factor.factorRecursive(value: performanceTestValue)
        }
    }
    func testRegularPerformance() {
        self.measure {
            _ = Factor.factorRegular(value: performanceTestValue)
        }
    }

}
