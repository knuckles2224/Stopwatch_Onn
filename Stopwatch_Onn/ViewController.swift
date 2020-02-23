//
//  ViewController.swift
//  Stopwatch_Onn
//
//  Created by Anthony Onn on 2/21/20.
//  Copyright © 2020 Anthony Onn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let stopwatch = Stopwatch() //create instance of Stopwatch
    
    //code to stop the clock
    @IBAction func startButtonTapped(_ sender: UIButton) {

        //checks if stopwatch is not running <- if true, run. Otherwise it is already running
        if(stopwatch.isRunning != true) {
            stopwatch.isRunning = true
            Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateElapsedTimeLabel), userInfo: self, repeats: true)
            stopwatch.start()
        }//end stopwatch is not running doing this
    }//end startButtonTapped
    
    //code to stop the clock
    @IBAction func stopButtonTapped(_ sender: UIButton) {

        //if stopwatch is not running and stop is clicked, reset time.
        if(stopwatch.isRunning == false) {
            timeElapsed.text = "00:00:0"
            stopwatch.time = 0
        }//if watch is already stopped
        
        //set isRunning to false and call stop func
        stopwatch.isRunning = false
        stopwatch.stop()
    }//end stopButtonTapped
    
    @IBOutlet weak var timeElapsed: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }//end viewdidload


    @objc func updateElapsedTimeLabel(timer: Timer) {
       
        if (stopwatch.isRunning == true) {
            timeElapsed.text = stopwatch.elapsedTimeAsString
        } else {
            timer.invalidate()
        }
    }//end func updateElapsedTimeLabel
    
}//end class

