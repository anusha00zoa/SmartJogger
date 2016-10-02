//
//  VC2.swift
//  MW01_Singh_Anusha
//
//  Created by SINGH ANUSHA  on 9/30/16.
//  Copyright © 2016 SINGH ANUSHA . All rights reserved.
//

import UIKit

class VC2: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    let vc1Obj = VC1()
    
    @IBOutlet weak var navBar: UINavigationBar!
    
    @IBOutlet weak var fastestLapLabel: UILabel!
    @IBOutlet weak var slowestLapLabel: UILabel!
    @IBOutlet weak var averageLapLabel: UILabel!
    @IBOutlet weak var lapTableView: UITableView!
    
    public var lapTableViewPopulateData: [String] = []
    public var lapTableViewUsable: [Double] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        navBar.frame = CGRect(x: 0, y: 0, width: 414, height: 66)
        
        self.lapTableView.dataSource = self
        self.lapTableView.delegate = self
        
        CalculateStats()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //function to calculate fastest, slowest and average lap times
    func CalculateStats()
    {
        var maxLap = 0.0, minLap = 0.0, avgLap = 0.0, sum = 0.0
        
        if lapTableViewUsable.isEmpty
        {
            fastestLapLabel.text = "Fastest Lap: 0:00.0"
            slowestLapLabel.text = "Slowest Lap: 0:00.0"
            averageLapLabel.text = "Average Lap: 0:00.0"
        }
        else
        {
            var dataNumeric = lapTableViewUsable.first!
            
            minLap = dataNumeric
            for data in lapTableViewUsable
            {
                dataNumeric = data
            
                if dataNumeric > maxLap
                {
                    maxLap = dataNumeric
                }
                if dataNumeric < minLap
                {
                    minLap = dataNumeric
                }
                sum += dataNumeric
            }
            avgLap = sum / Double(lapTableViewPopulateData.count)

            fastestLapLabel.text = "Fastest Lap: " + vc1Obj.ConvertToFormat(time: minLap)
            slowestLapLabel.text = "Slowest Lap: " + vc1Obj.ConvertToFormat(time: maxLap)
            averageLapLabel.text = "Average Lap: " + vc1Obj.ConvertToFormat(time: avgLap)
        }
    }
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return lapTableViewPopulateData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lapTableViewCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.font = UIFont(name: "Minimal", size:26)
        cell.detailTextLabel?.font = UIFont(name: "Minimal", size:26)
        
        let row = indexPath.row
        cell.textLabel?.text = "Lap " + String(row) + ":"
        cell.detailTextLabel?.text = lapTableViewPopulateData[row]
        
        return cell
    }

    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
    
    }*/
}
