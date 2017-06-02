
//
//  PreBookingViewController.swift
//  KaRide
//
//  Created by Elliot Licht on 07/03/2017.
//  Copyright © 2017 Ilia Tikhomirov. All rights reserved.
//

import UIKit
class PreBookingViewController: UIViewController {
    
    // MARK: STPPaymentContextDelegate
    
    @IBOutlet weak var avatarOutlet: UIImageView!
    var rideObject: Ride!    
    //Outlets
    
    @IBOutlet weak var nameOutlet: UILabel!
    @IBOutlet weak var modelOutlet: UILabel!
    @IBOutlet weak var depTimeOutlet: UILabel!
    @IBOutlet weak var arTimeOutlet: UILabel!
    @IBOutlet weak var fromOutlet: UILabel!
    @IBOutlet weak var toOutlet: UILabel!
    @IBOutlet weak var priceOutlet: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        avatarOutlet.layer.cornerRadius = self.avatarOutlet.frame.size.width / 2;
        self.avatarOutlet.clipsToBounds = true
        
        print(rideObject)
        nameOutlet.text = rideObject.name
        avatarOutlet.downloadedFrom(link: rideObject.photo)
        modelOutlet.text = rideObject.model
        depTimeOutlet.text = rideObject.depTime
        arTimeOutlet.text = rideObject.arTime
        priceOutlet.text = rideObject.price
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func bookDidTouch(_ sender: Any) {
        
        
    }
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
