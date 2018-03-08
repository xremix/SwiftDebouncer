//
//  DebounceCallTests.swift
//  SwiftDebouncerTests
//
//  Created by Toni Hoffmann on 08.03.18.
//  Copyright © 2018 Toni Hoffmann. All rights reserved.
//

import XCTest

@testable import SwiftDebouncer

class DebounceCallTests: XCTestCase {
    
    
    func testCallWithoutCallback(){
        
        let d = Debouncer(delay: 0)
        
        d.call()
        XCTAssertTrue(true)
    }
    
    func testRunOnceImmediatly(){
        let e = expectation(description: "Run once and call immediatly")
        
        let d = Debouncer(delay: 0)
        d.callback = {
            e.fulfill()
        }
        
        d.call()
        
        self.wait(for: [e], timeout: 1)
    }
    func testRunOnceDelayed(){
        let e = expectation(description: "write some descriptive expectation :)")
        
        let d = Debouncer(delay: 1)
        d.callback = {
            e.fulfill()
        }
        
        d.call()
        
        // Wait timeout in seconds
        self.wait(for: [e], timeout: 2)
    }
    
    // TODO research how to properly test 0 expectations
//    func testRunOnceDelayedAndCheckBefore(){
//        let e = expectation(description: "should run zero times because the expectation will be checked immediatly")
//        e.expectedFulfillmentCount = 0
//
//        let d = Debouncer(delay: 100)
//        d.callback = {
//            e.fulfill()
//        }
//
//        d.call()
//
//        // Wait timeout in seconds
//        self.wait(for: [e], timeout: 0)
//    }
    
    
    func testRunTwiceCountOnce(){
        let e = expectation(description: "should fullfile once, because calls are both runned immediatly and second one should get ignored")
        e.expectedFulfillmentCount = 1
        let d = Debouncer(delay: TimeInterval(exactly: 1)!)
        d.callback = {
            e.fulfill()
        }
        d.call()
        d.call()
        
        // Wait timeout in seconds
        self.wait(for: [e], timeout: 3)
    }
    
    func testRunTwiceCountTwice(){
        let e = expectation(description: "should fulfill twice")
        e.expectedFulfillmentCount = 2
        let d = Debouncer(delay: TimeInterval(exactly: 1)!)
        d.callback = {
            e.fulfill()
        }
        d.call()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            d.call()
        })
        
        // Wait timeout in seconds
        self.wait(for: [e], timeout: 3)
    }
    
    func testRunThreeTimseeCountThreeTimes(){
        let e = expectation(description: "should fulfill three times")
        e.expectedFulfillmentCount = 3
        let d = Debouncer(delay: TimeInterval(exactly: 1)!)
        d.callback = {
            e.fulfill()
        }
        d.call()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            d.call()
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            d.call()
        })
        
        // Wait timeout in seconds
        self.wait(for: [e], timeout: 3)
    }
    func testRunThreeTimseeCountTwice(){
        let e = expectation(description: "should fulfill three times")
        e.expectedFulfillmentCount = 2
        let d = Debouncer(delay: TimeInterval(exactly: 1)!)
        d.callback = {
            e.fulfill()
        }
        d.call()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            d.call()
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
            d.call()
        })
        
        // Wait timeout in seconds
        self.wait(for: [e], timeout: 2)
    }
    
}
