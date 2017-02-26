//
//  CitySelectionTableViewController.swift
//  KaRide
//
//  Created by Elliot Licht on 24/02/2017.
//  Copyright © 2017 Ilia Tikhomirov. All rights reserved.
//

import UIKit

class CitySelectionTableViewController: UITableViewController {
    
    var cities = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        cities = ["Canberra", "Sydney", "Melbourne"]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.navigationItem.title = ProxiHelper.sharedInstance.targetPage
        if ProxiHelper.sharedInstance.targetPage == "From" {
            if let mirrorVal = ProxiHelper.sharedInstance.offerTo {
                cities = cities.filter() {$0 != mirrorVal}
            }
        } else {
            if let mirrorVal = ProxiHelper.sharedInstance.offerFrom {
                cities = cities.filter() {$0 != mirrorVal}
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cities.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "city", for: indexPath) as! CitySelectionTableViewCell

        // Configure the cell...
        cell.cityLabel.text = cities[indexPath.row]

        return cell
    }
    
    @IBAction func dismissView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true, completion: nil)
        
        if ProxiHelper.sharedInstance.origin == "offer" && ProxiHelper.sharedInstance.targetPage == "To" {
            
            ProxiHelper.sharedInstance.offerTo = cities[indexPath.row]
            
        } else if ProxiHelper.sharedInstance.origin == "offer" && ProxiHelper.sharedInstance.targetPage == "From" {
            
            ProxiHelper.sharedInstance.offerFrom = cities[indexPath.row]
            
        }
    }

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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
