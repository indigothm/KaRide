//
//  OfferDetailsViewController.swift
//  KaRide
//
//  Created by Elliot Licht on 26/02/2017.
//  Copyright © 2017 Ilia Tikhomirov. All rights reserved.
//

import UIKit

class OfferDetailsViewController: UIViewController, UpdateViewDelegateProtocol, UITextFieldDelegate {
    
    @IBOutlet weak var depImage: UIImageView!
    @IBOutlet weak var arImage: UIImageView!
    @IBOutlet weak var depOutlet: UIButton!
    @IBOutlet weak var arOutlet: UIButton!
    
    @IBOutlet weak var carModelOutlet: UITextField!
    @IBOutlet weak var contactOutlet: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        carModelOutlet.delegate = self
        contactOutlet.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateView() {
        //update
        
        if let departVal = ProxiHelper.sharedInstance.offerDep {
            
            print(departVal)
            
            let formatter = DateFormatter()
            formatter.dateStyle = DateFormatter.Style.none
            formatter.timeStyle = .short
            
            let timeString = formatter.string(from: departVal)
            
            depOutlet.setTitle(timeString, for: .normal)
            depOutlet.setTitleColor(UIColor.black, for: .normal)
            depImage.image = UIImage(named: "oval-dark")
            
        }
        
        if let arVal = ProxiHelper.sharedInstance.offerAr {
            
            print(arVal)
            
            let formatter = DateFormatter()
            formatter.dateStyle = DateFormatter.Style.none
            formatter.timeStyle = .short
            
            let timeString = formatter.string(from: arVal)
            
            arOutlet.setTitle(timeString, for: .normal)
            arOutlet.setTitleColor(UIColor.black, for: .normal)
            arImage.image = UIImage(named: "oval-dark")
            
        }
        

    }
    
    
    @IBAction func createRideDidTouch(_ sender: Any) {
        
        if contactOutlet.text != nil && carModelOutlet.textColor != nil {
            
            ProxiHelper.sharedInstance.offerModel = carModelOutlet.text!
            
            ProxiHelper.sharedInstance.offerContact = contactOutlet.text!
            
            let timeformatter = DateFormatter()
            timeformatter.dateStyle = DateFormatter.Style.none
            timeformatter.timeStyle = .short

            let dateformatter = DateFormatter()
            dateformatter.dateStyle = DateFormatter.Style.short
            dateformatter.timeStyle = .none
            
            FirebaseHelper.sharedInstance.createRideOffer(
                
                from: ProxiHelper.sharedInstance.offerFrom!,
                to: ProxiHelper.sharedInstance.offerTo!,
                date: dateformatter.string(from: ProxiHelper.sharedInstance.offerDate),
                pass: ProxiHelper.sharedInstance.offerPass!,
                price: ProxiHelper.sharedInstance.offerPrice!,
                depTime: timeformatter.string(from: ProxiHelper.sharedInstance.offerDep),
                arTime: timeformatter.string(from: ProxiHelper.sharedInstance.offerAr),
                model: ProxiHelper.sharedInstance.offerModel!,
                contact: ProxiHelper.sharedInstance.offerContact!)
            
        }
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "depTime"  {
            
            let controller = segue.destination as! TimePickerViewController
            controller.requestType = "Dep"
             controller.delegate = self
            
        } else if segue.identifier == "arTime" {
            
            let controller = segue.destination as! TimePickerViewController
            controller.requestType = "Ar"
             controller.delegate = self
            
        }
        
    }
    

}
