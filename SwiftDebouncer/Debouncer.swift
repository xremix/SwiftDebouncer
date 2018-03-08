//
//  Debouncer.swift
//  Debouncer
//
//  Created by Toni Hoffmann on 08.03.18.
//  Copyright © 2018 Toni Hoffmann. All rights reserved.
//

import UIKit

public class Debouncer: NSObject {
    var callback: (() -> Void)?
    let delay: TimeInterval
    private var timer: Timer?
    
    init(delay: TimeInterval){
        self.delay = delay
    }
    
    init(delay: TimeInterval, callback: @escaping (()->Void)){
        self.delay = delay
        self.callback = callback
    }
    
    func call(){
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(timerCalled), userInfo: nil, repeats: false)
    }
    @objc private func timerCalled(_ timer: Timer) {
        if callback == nil {
            NSLog("Debouncer timer fired, but callback was nil")
        } else {
            NSLog("Debouncer timer fired")
        }
        callback?()
    }
}
