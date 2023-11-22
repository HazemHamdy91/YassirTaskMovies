//
//  BaseTestCase.swift
//  YassirTaskMoviesTests
//
//  Created by Hazem  on 22.11.23.
//

import Foundation
import XCTest

class BaseTestCase: XCTestCase {
    // In order to improve XCTest assert failure handling. To be more like JUnit (Eclipse or IntelliJ IDEA testing)
    // Running through all test cases and stop on first assert failure to prevent crashes or minimize runtime
    override func invokeTest() {
        // We change to continue after failure, which will stop executing test case on first assert failure
        self.continueAfterFailure = false
        // defer that we want to continue after failure, otherwise the whole test run would be stopped, but we only want
        // to stop the concurrent test case, maybe to prevent crashes or whatever
        defer {
            self.continueAfterFailure = true
        }
        // execute current test case
        super.invokeTest()
    }
}

func given<A>(_ description: String, block: () throws -> A) rethrows -> A {
    print("[ Given ]", description)
    return try XCTContext.runActivity(named: "Given " + description, block: { _ in try block() })
}

func when<A>(_ description: String, block: () throws -> A) rethrows -> A {
    print("[  When ]", description)
    return try XCTContext.runActivity(named: "When " + description, block: { _ in try block() })
}

func then<A>(_ description: String, block: () throws -> A) rethrows -> A {
    print("[  Then ]", description)
    return try XCTContext.runActivity(named: "Then " + description, block: { _ in try block() })
}
