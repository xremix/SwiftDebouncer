//
//  Debouncer.swift
//  Debouncer
//
//  Created by Toni Hoffmann on 08.03.18.
//  Copyright © 2018 Toni Hoffmann. All rights reserved.
//

import UIKit

/** Debouncer class to delay functions that only get delay each other until the timer fires  */
public class Debouncer: NSObject {
    
    /** Callback that is getting called when the timer fires */
    var callback: (() -> Void)?
    
    /** Delay Time in ms */
    let delay: TimeInterval
    
    /** Timer to fire the callback event */
    private var timer: Timer?
    
    /** Init with delay time as argument */
    init(delay: TimeInterval){
        self.delay = delay
    }
    
    /** Init with delay time and callback argument */
    init(delay: TimeInterval, callback: @escaping (()->Void)){
        self.delay = delay
        self.callback = callback
    }
    
    /** Call debouncer to start the callback after the delayed time. Multiple calls will ignore the older calls and overwrite the firing time */
    func call(){
        // Cancle timer, if one already exists
        timer?.invalidate()
        // Reset timer to fire next event
        timer = Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(timerCalled), userInfo: nil, repeats: false)
    }
    
    /** Function to fire the fallback, if it was set */
    @objc private func timerCalled(_ timer: Timer) {
        if callback == nil {
            NSLog("Debouncer timer fired, but callback was not set")
        }
        callback?()
    }
}
