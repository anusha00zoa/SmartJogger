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
    
    var startTime: Double = 0.0
    var currentTime: Double = 0.0
    var elapsedTime: Double = 0.0
    var lapTime: Double = 0.0
    var totalTime: Double = 0.0
    var finishTime: Double = 0.0
    
    var numberOfLaps: Int = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        newLapButton.isEnabled = false
        showStatsButton.isEnabled = false

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func UpdateTimeForCurrentLap()
    {
        print("New Lap Started at " + String(startTime))
        currentTime = NSDate.timeIntervalSinceReferenceDate
        
        elapsedTime = currentTime - startTime
        totalTime += elapsedTime;
        
        currentLapLabel.text = "Current Lap: " + String(elapsedTime)
        totalTimeLabel.text = "Total Time: " + String(totalTime)
    }
    
    func StartNewLap()
    {
        startTime = NSDate.timeIntervalSinceReferenceDate
        UpdateTimeForCurrentLap()
        
    }
    
    @IBAction func StartButtonClicked(_ sender: AnyObject)
    {
        if(startStopToggleButton.title(for: UIControlState.normal) == "Start")
        {
            startStopToggleButton.setTitle("Stop", for: UIControlState.normal)
            newLapButton.isEnabled = true
            
            StartNewLap()
            
            numberOfLaps += 1
            numberOfLapsLabel.text = "Number Of Laps: " + String(numberOfLaps)
        }
        else
        {
            startStopToggleButton.setTitle("Start", for: UIControlState.normal)
        }
    }
    
    @IBAction func NewLapButtonClicked(_ sender: AnyObject)
    {
        
    }
    
    @IBAction func ShowStatsButtonClicked(_ sender: AnyObject)
    {
        
    }
    
    
    // MARK: - Table view data source

    /*override func numberOfSections(in tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }*/

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
