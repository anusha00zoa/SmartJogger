//
//  VC1.swift
//  MW01_Singh_Anusha
//
//  Created by SINGH ANUSHA  on 9/21/16.
//  Copyright © 2016 SINGH ANUSHA . All rights reserved.
//

import UIKit

class VC1: UIViewController
{
    @IBOutlet weak var currentLapLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var numberOfLapsLabel: UILabel!

    @IBOutlet weak var startStopToggleButton: UIButton!
    @IBOutlet weak var newLapButton: UIButton!
    @IBOutlet weak var showStatsButton: UIButton!
    
    var startTime = 0.0
    var currentTime = 0.0
    var elapsedTime = 0.0
    var lapTime = 0.0
    var totalTime = 0.0
    
    var numberOfLaps: Int = 0
    
    var jogTimer: Timer!
    
    public var lapData: [(String, String)] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        newLapButton.isEnabled = false
        showStatsButton.isEnabled = false
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func ConvertToFormat(time: Double) -> String
    {
        var strTime: String = ""
        
        var pseudoTime: Double = time
        
        let timeInMin = UInt8(pseudoTime / 60.0)
        let strTimeInMin = String(format: "%1d", timeInMin);
        
        pseudoTime -= (TimeInterval(timeInMin) * 60)

        let timeInSec = UInt8(pseudoTime)
        let strTimeInSec = String(format: "%02d", timeInSec);

        pseudoTime -= TimeInterval(timeInSec)
        
        let timeInMilliSec = UInt8(pseudoTime * 10)
        let strTimeInMilliSec = String(format: "%1d", timeInMilliSec);
        
        strTime = "\(strTimeInMin):\(strTimeInSec):\(strTimeInMilliSec)"
        
        return strTime
    }
    
    func TimeTakenForCurrentLap()
    {
        currentTime = NSDate.timeIntervalSinceReferenceDate
        
        elapsedTime = currentTime - startTime
        totalTime = elapsedTime;
        
        currentLapLabel.text = "Current Lap: " + ConvertToFormat(time: elapsedTime)
        totalTimeLabel.text = "Total Time: " + ConvertToFormat(time: totalTime)
        
    }
    
    @IBAction func StartButtonClicked(_ sender: AnyObject)
    {
        if(startStopToggleButton.title(for: UIControlState.normal) == "START")
        {
            startStopToggleButton.setTitle("STOP", for: .normal)
            
            newLapButton.isEnabled = true
            newLapButton.backgroundColor = UIColor.lightGray.withAlphaComponent(0.75)
            numberOfLaps = 1
            numberOfLapsLabel.text = "Number Of Laps: " + String(numberOfLaps)
            
            let sel : Selector = #selector(VC1.TimeTakenForCurrentLap)
            jogTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: sel, userInfo: nil, repeats: true)
            startTime = NSDate.timeIntervalSinceReferenceDate
        }
        else
        {
            startStopToggleButton.setTitle("START", for: .normal)
            startStopToggleButton.isEnabled = false
            startStopToggleButton.backgroundColor = UIColor.darkGray

            newLapButton.isEnabled = false
            newLapButton.backgroundColor = UIColor.darkGray
            
            showStatsButton.isEnabled = true
            showStatsButton.backgroundColor = UIColor.lightGray.withAlphaComponent(0.75)
            
            jogTimer.invalidate()
            
        }
    }
    
    @IBAction func NewLapButtonClicked(_ sender: AnyObject)
    {
        numberOfLaps +=  1
        numberOfLapsLabel.text = "Number Of Laps: " + String(numberOfLaps)
    }
    
    @IBAction func ShowStatsButtonClicked(_ sender: AnyObject)
    {
        
    }
}
