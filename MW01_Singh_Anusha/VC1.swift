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
    
    var lapDataUsable: [Double] = []
    var lapData: [String] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        newLapButton.isEnabled = false
        newLapButton.backgroundColor = UIColor.lightGray
        
        showStatsButton.isEnabled = false
        showStatsButton.backgroundColor = UIColor.lightGray
        
        startStopToggleButton.backgroundColor = UIColor.white
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    //utility function to convert time in seconds to time in the desired format
    public func ConvertToFormat(time: Double) -> String
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
            
            //enable New Lap button
            newLapButton.isEnabled = true
            newLapButton.backgroundColor = UIColor.white
            numberOfLaps = 1
            numberOfLapsLabel.text = "Number Of Laps: " + String(numberOfLaps)
            
            let sel : Selector = #selector(VC1.TimeTakenForCurrentLap)
            jogTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: sel, userInfo: nil, repeats: true)
            startTime = NSDate.timeIntervalSinceReferenceDate
        }
        else
        {
            startStopToggleButton.setTitle("START", for: .normal)
            
            //disable Start button
            startStopToggleButton.isEnabled = false
            startStopToggleButton.backgroundColor = UIColor.lightGray
            
            //disable New Lap button
            newLapButton.isEnabled = false
            newLapButton.backgroundColor = UIColor.lightGray
            
            //enable Show Stats button
            showStatsButton.isEnabled = true
            showStatsButton.backgroundColor = UIColor.white
            
            //stop timer and add last lap info to the data source
            jogTimer.invalidate()
            lapTime = elapsedTime
            lapData.append(ConvertToFormat(time: lapTime))
            lapDataUsable.append(lapTime)
        }
    }
    
    @IBAction func NewLapButtonClicked(_ sender: AnyObject)
    {
        //convert to desired format for display
        lapTime = elapsedTime
        lapData.append(ConvertToFormat(time: lapTime))
        lapDataUsable.append(lapTime)
        
        numberOfLaps +=  1
        numberOfLapsLabel.text = "Number Of Laps: " + String(numberOfLaps)
        
        //restart timer for new lap
        jogTimer.invalidate()
        let sel : Selector = #selector(VC1.TimeTakenForCurrentLap)
        jogTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: sel, userInfo: nil, repeats: true)
        startTime = NSDate.timeIntervalSinceReferenceDate
   }
    
    @IBAction func ShowStatsButtonClicked(_ sender: AnyObject)
    {
        
    }
    
    @IBAction func ResetButtonClicked(_ sender: AnyObject)
    {
        lapDataUsable.removeAll()
        lapData.removeAll()
        
        currentTime = 0.0
        elapsedTime = 0.0
        lapTime = 0.0
        currentLapLabel.text = "Current Time: 0:00.0"

        totalTime = 0.0
        totalTimeLabel.text = "Total Time: 0:00.0"
        
        numberOfLaps = 0
        numberOfLapsLabel.text = "Number Of Laps: 0"
        
        newLapButton.isEnabled = false
        newLapButton.backgroundColor = UIColor.lightGray
        
        showStatsButton.isEnabled = false
        showStatsButton.backgroundColor = UIColor.lightGray
        
        startStopToggleButton.isEnabled = true
        startStopToggleButton.backgroundColor = UIColor.white
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "showStatsSegue"
        {
            let vc2Controller = segue.destination as! VC2
            vc2Controller.lapTableViewPopulateData = lapData
            vc2Controller.lapTableViewUsable = lapDataUsable
        }
    }
}
