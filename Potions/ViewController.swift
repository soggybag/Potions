//
//  ViewController.swift
//  Potion Swift 2
//
//  Created by mitchell hudson on 12/15/14.
//  Copyright (c) 2014 mitchell hudson. All rights reserved.
//

// Todo: 

// UIAppearance - create a custome style for elements 

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DetailViewControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Load the default data 
        PotionStore.sharedInstance.addDefaultData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Segue methods
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var thePotion: Potion!
        
        if segue.identifier == "ShowPotionSegue" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                thePotion = PotionStore.sharedInstance.get(indexPath.row)
            }
        } else if segue.identifier == "AddPotionSegue" {
            thePotion = Potion()
        } else if segue.identifier == "RandomPotionSegue" {
            thePotion = PotionStore.sharedInstance.getRandomPotion()
        }
        
        (segue.destinationViewController as! DetailTableViewController).potion = thePotion
    }
    
    
    
    /*
    @IBAction func unwindFromViewController(segue: UIStoryboardSegue) {
        println("Unwind from view controller")
        if segue.sourceViewController.isKindOfClass(DetailTableViewController) {
            let detailVC = segue.sourceViewController as DetailTableViewController
            // 
        }
    }
    */
    
    // MARK: - Table View delegate and data source methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PotionStore.sharedInstance.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")!
        
        let potion = PotionStore.sharedInstance.get(indexPath.row)
        cell.textLabel?.text = potion.name
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            PotionStore.sharedInstance.removePotionAt(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
        }
    }

}























