//
//  OfferaRideViewController.swift
//  KaRide
//
//  Created by Elliot Licht on 25/02/2017.
//  Copyright © 2017 Ilia Tikhomirov. All rights reserved.
//

import UIKit
import DatePickerDialog

class OfferaRideViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func updateView() {
    
        if let fromVal = ProxiHelper.sharedInstance.offerFrom {
            
            print(fromVal)
            
            fromOutlet.setTitle(fromVal, for: .normal)
            fromOutlet.setTitleColor(UIColor.black, for: .normal)
            fromImage.image = UIImage(named: "oval-dark")
            
        }
        
        if let toVal = ProxiHelper.sharedInstance.offerTo {
            
            print(toVal)
            
            toOutlet.setTitle(toVal, for: .normal)
            toOutlet.setTitleColor(UIColor.black, for: .normal)
            toImage.image = UIImage(named: "oval-dark")
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
       updateView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var dateOutlet: UIButton!
    @IBOutlet weak var fromOutlet: UIButton!
    @IBOutlet weak var toOutlet: UIButton!
    @IBOutlet weak var passOutlet: UIButton!
    @IBOutlet weak var priceOutlet: UIButton!
    
    @IBOutlet weak var fromImage: UIImageView!
    @IBOutlet weak var toImage: UIImageView!
    @IBOutlet weak var dateImage: UIImageView!
    @IBOutlet weak var priceImage: UIImageView!
    
    
    @IBAction func datePickerDidTouch(_ sender: Any) {
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
            ProxiHelper.sharedInstance.origin = "offer"
        
            if segue.identifier == "from" {
               ProxiHelper.sharedInstance.targetPage = "From"
            } else if segue.identifier == "to" {
               ProxiHelper.sharedInstance.targetPage = "To"
            }
        
            if segue.identifier == "price" {
                 let controller = segue.destination as! PickerViewController
                
                controller.requestType = "price"
                
            } else if segue.identifier == "pass" {
                let controller = segue.destination as! PickerViewController
                
                controller.requestType = "pass"
            }
        
        
        
    }
 
    

}
