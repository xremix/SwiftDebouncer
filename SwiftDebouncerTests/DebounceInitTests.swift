//
//  DebounceTests.swift
//  SwiftDebouncerTests
//
//  Created by Toni Hoffmann on 08.03.18.
//  Copyright © 2018 Toni Hoffmann. All rights reserved.
//

import XCTest
@testable import SwiftDebouncer

class DebounceInitTests: XCTestCase {
    
    
    func testDebounceInitWithDelay(){
        let delayInMs: TimeInterval = 10
        let d = Debouncer(delay: 10)
        XCTAssertNotNil(d)
        XCTAssertEqual(d.delay, delayInMs)
    }
    func testDebounceInitWithDouble(){
        let delayInMsAsDouble: Double = 10
        let d = Debouncer(delay: delayInMsAsDouble)
        
        XCTAssertNotNil(d)
        XCTAssertEqual(d.delay, delayInMsAsDouble)
        
    }
    
    func testDebounceInitWithDelayAndCallback(){
        let callback = {
            print("callback called")
        }
        let ms: TimeInterval = 10
        let d = Debouncer(delay: 10, callback: callback)
        XCTAssertNotNil(d)
        XCTAssertEqual(d.delay, ms)
        XCTAssertNotNil(d.callback)
    }
    func testCallbackNotNil(){
        let callback = {
            print("callback called")
        }
        let ms: TimeInterval = 10
        let d = Debouncer(delay: 10)
        d.callback = callback
        
        XCTAssertNotNil(d)
        XCTAssertEqual(d.delay, ms)
        XCTAssertNotNil(d.callback)
    }
    
}
