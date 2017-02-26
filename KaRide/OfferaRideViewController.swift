//
//  OfferaRideViewController.swift
//  KaRide
//
//  Created by Elliot Licht on 25/02/2017.
//  Copyright © 2017 Ilia Tikhomirov. All rights reserved.
//

import UIKit
import DatePickerDialog

class OfferaRideViewController: UIViewController, UpdateViewDelegateProtocol {

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
        
        if let dateVal = ProxiHelper.sharedInstance.offerDate {
            
            print(dateVal)
            
            let formatter = DateFormatter()
            formatter.dateStyle = DateFormatter.Style.long
            formatter.timeStyle = .none
            
            let dateString = formatter.string(from: dateVal)
            
            
           // formatter.dateFormat = "d, MMMM"
            
            dateOutlet.setTitle(dateString, for: .normal)
            dateOutlet.setTitleColor(UIColor.black, for: .normal)
            dateImage.image = UIImage(named: "calendar-dark")
        
        }
        
        if let priceVal = ProxiHelper.sharedInstance.offerPrice {
            
            print(priceVal)
            
            priceOutlet.setTitle(priceVal, for: .normal)
            priceOutlet.setTitleColor(UIColor.black, for: .normal)
            priceImage.image = UIImage(named: "money-dark")
            
        }
        
        if let passVal = ProxiHelper.sharedInstance.offerPass {
            
            print(passVal)
            
            passOutlet.text = passVal
            
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
    @IBOutlet weak var priceOutlet: UIButton!
    @IBOutlet weak var passOutlet: UILabel!
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
                
                controller.delegate = self
                controller.requestType = "price"
                
            } else if segue.identifier == "pass" {
                let controller = segue.destination as! PickerViewController
                
                controller.delegate = self
                controller.requestType = "pass"
            }
        
            if segue.identifier == "date" {
               let controller = segue.destination as! DatePickerViewController
               controller.delegate = self
            }

        
    }
 
    @IBAction func nextDidTouch(_ sender: Any) {
        
        if ProxiHelper.sharedInstance.offerPass == nil {
            ProxiHelper.sharedInstance.offerPass = "1"
        }
        
        if (ProxiHelper.sharedInstance.offerTo != nil) &&  (ProxiHelper.sharedInstance.offerTo != nil) && (ProxiHelper.sharedInstance.offerTo != nil) && (ProxiHelper.sharedInstance.offerDate != nil) && (ProxiHelper.sharedInstance.offerPrice != nil) {
         
            performSegue(withIdentifier: "details", sender: self)
            
        } else {
            
            let alert = UIAlertController(title: "Error", message: "Please fill in all the fields", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    

}
