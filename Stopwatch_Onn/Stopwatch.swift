//
//  Stopwatch.swift
//  Stopwatch_Onn
//
//  Created by Anthony Onn on 2/21/20.
//  Copyright © 2020 Anthony Onn. All rights reserved.
//

import Foundation

// Goals: find current time, calculate elapsed time, and convert elapsed time to string
class Stopwatch {
    
    private var startTime: NSDate?
    
    var isRunning: Bool?
    
    var time: Int = 0
    
    var elapsedTime: TimeInterval {
        if let startTime = self.startTime {
            return -1 * startTime.timeIntervalSinceNow
        } else {
            return 0
        }// else return 0
    }//end var
    
    var elapsedTimeAsString: String {
     
        time = time + 1
        
        let seconds:Int = (time / 10) % 60  // 1 second pass, divide by 10
        let minutes:Int = (time / 600) % 60 // 60 seconds pass, divide by 10 * 60
        let milliseconds:Int = (time) % 10
        return String(format: "%02d:%02d:%01d" , minutes ,seconds, milliseconds)

    }//end elapsed time as string
    
    func start() {
        startTime = NSDate()
    }//end start
    
    func stop() {
        startTime = nil
    }//end stop
    
}//end class Stopwatch
