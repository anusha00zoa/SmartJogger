//
//  VC2.swift
//  MW01_Singh_Anusha
//
//  Created by SINGH ANUSHA  on 9/30/16.
//  Copyright © 2016 SINGH ANUSHA . All rights reserved.
//

import UIKit

class VC2: UIViewController
{
    @IBOutlet weak var navBar: UINavigationBar!
    
    @IBOutlet weak var fastestLapLabel: UILabel!
    @IBOutlet weak var slowestLapLabel: UILabel!
    @IBOutlet weak var averageLapLabel: UILabel!
    
    var lapTableView: VC2EmbeddedTableViewController!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        navBar.frame = CGRect(x: 0, y: 0, width: 414, height: 66)
        
        lapTableView = self.childViewControllers.last as! VC2EmbeddedTableViewController
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
    }*/
}
