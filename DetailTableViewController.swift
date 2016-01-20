//
//  DetailTableViewController.swift
//  Potion Swift 2
//
//  Created by mitchell hudson on 12/20/14.
//  Copyright (c) 2014 mitchell hudson. All rights reserved.
//

import UIKit
import Realm

protocol DetailViewControllerDelegate {
    
}

class DetailTableViewController: UITableViewController, UITextFieldDelegate {

    var potion: Potion!
    var name = ""
    var effect = ""
    var frequency = 1
    var descriptor = ""
    
    var delegate: DetailViewControllerDelegate!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var effectText: UITextView!
    @IBOutlet weak var frequencyField: UITextField!
    @IBOutlet weak var descriptionText: UITextView!
    
    
    @IBAction func frequencyStepperChanged(sender: UIStepper) {
        frequency += Int(sender.value)
        sender.value = 0
        frequencyField.text = "\(frequency)"
    }
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        if validatePotion() {
            let realm = RLMRealm.defaultRealm()
            realm.beginWriteTransaction()
            
            potion.name = nameField.text!
            potion.effect = effectText.text
            potion.frequency = Int(frequencyField.text!)!
            potion.descriptor = descriptionText.text
            
            realm.commitWriteTransaction()
            
            PotionStore.sharedInstance.addPotion(potion)
            
            navigationController?.popViewControllerAnimated(true)
        }
    }
    
    
    @IBAction func randomDescriptionButtonPressed(sender: AnyObject) {
        let newDescriptor = Descriptor().get()
        if potion != nil {
            let realm = RLMRealm.defaultRealm()
            realm.beginWriteTransaction()
            
            potion.descriptor = newDescriptor
            
            realm.commitWriteTransaction()
            
            descriptionText.text = newDescriptor
        }
    }
    
    
    func validatePotion() -> Bool {
        if nameField.text != "" && frequency > 0 {
            return true
        }
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name = potion.name
        effect = potion.effect
        frequency = potion.frequency
        descriptor = potion.descriptor
        
        showPotion()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = potion.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func showPotion() {
        nameField.text = name
        effectText.text = effect
        frequencyField.text = "\(frequency)"
        descriptionText.text = descriptor
    }
    
    
    // MARK: - textField Delegate methods
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        tableView.endEditing(true)
    }
    
    /*
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        super.touchesBegan(touches, withEvent: event)
        tableView.endEditing(true)
    }
    */
    

    // MARK: - Table view data source
    
    /*
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.min;
    }
   
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 0
    }*/

    /*
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 0
    }*/

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */


    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return false
    }


    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
