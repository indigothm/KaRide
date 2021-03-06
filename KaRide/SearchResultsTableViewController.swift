//
//  SearchResultsTableViewController.swift
//  KaRide
//
//  Created by Elliot Licht on 28/02/2017.
//  Copyright © 2017 Ilia Tikhomirov. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController {
    
    var results = [Ride]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return results.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ride", for: indexPath) as! RideTableViewCell

        // Configure the cell...
        cell.depTimeLabel.text = results[indexPath.row].depTime
        cell.arTimeLabel.text = results[indexPath.row].arTime
        cell.fromLabel.text = results[indexPath.row].from
        cell.toLabel.text = results[indexPath.row].to
        cell.priceLabel.text = results[indexPath.row].price
        
        let driver = FirebaseHelper.sharedInstance.getUserFromID(id: results[indexPath.row].driver, callback: {
            user in
            
            cell.avatarOutlet.downloadedFrom(link: user.Photo)
            cell.nameOutlet.text = user.Name
            
            self.results[indexPath.row].name = user.Name
            self.results[indexPath.row].photo = user.Photo
        })
        

        return cell
    }
    
    var selectedRide: Ride!
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedRide = results[indexPath.row]
        performSegue(withIdentifier: "booking", sender: self)
        
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "booking" {
            let controller = segue.destination as! PreBookingViewController
            controller.rideObject = selectedRide
        }
    }
    

}
