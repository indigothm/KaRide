//
//  FindaRideViewController.swift
//  KaRide
//
//  Created by Elliot Licht on 25/02/2017.
//  Copyright © 2017 Ilia Tikhomirov. All rights reserved.
//

import UIKit


class FindaRideViewController: UIViewController, UpdateViewDelegateProtocol {
    
    //outlets
    @IBOutlet weak var fromImage: UIImageView!
    @IBOutlet weak var fromOutlet: UIButton!
    @IBOutlet weak var toImage: UIImageView!
    @IBOutlet weak var toOutlet: UIButton!
    @IBOutlet weak var dateImage: UIImageView!
    @IBOutlet weak var dateOutlet: UIButton!
    @IBOutlet weak var passOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateView() {
        
        //update view code
        if let dateVal = ProxiHelper.sharedInstance.searchDate {
            
            print(dateVal)
            
            let formatter = DateFormatter()
            formatter.dateStyle = DateFormatter.Style.long
            formatter.timeStyle = .none
            
            let dateString = formatter.string(from: dateVal)
            
            dateOutlet.setTitle(dateString, for: .normal)
            dateOutlet.setTitleColor(UIColor.black, for: .normal)
            dateImage.image = UIImage(named: "calendar-dark")
            
        }
        
        if let toVal = ProxiHelper.sharedInstance.searchTo {
            
            print(toVal)
            
            toOutlet.setTitle(toVal, for: .normal)
            toOutlet.setTitleColor(UIColor.black, for: .normal)
            toImage.image = UIImage(named: "oval-dark")
            
        }
        
        if let fromVal = ProxiHelper.sharedInstance.searchFrom {
            
            print(fromVal)
            
            fromOutlet.setTitle(fromVal, for: .normal)
            fromOutlet.setTitleColor(UIColor.black, for: .normal)
            fromImage.image = UIImage(named: "oval-dark")
            
        }
        
        if let passVal = ProxiHelper.sharedInstance.searchPass {
            
            print(passVal)
            
            passOutlet.text = passVal
            
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        updateView()
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
         ProxiHelper.sharedInstance.origin = "search"
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "from" {
            ProxiHelper.sharedInstance.targetPage = "From"
        } else if segue.identifier == "to" {
            ProxiHelper.sharedInstance.targetPage = "To"
        }
        
        if segue.identifier == "date" {
            
           
            let controller = segue.destination as! DatePickerViewController
            controller.delegate = self
            
        }
        
        if segue.identifier == "pass" {
            let controller = segue.destination as! PickerViewController
            
            controller.requestType = "pass"
            controller.delegate = self
        }
        
        if segue.identifier == "showResults" {
            
            let dateformatter = DateFormatter()
            dateformatter.dateStyle = DateFormatter.Style.short
            dateformatter.timeStyle = .none
            
            let searchDate = dateformatter.string(from: ProxiHelper.sharedInstance.searchDate)

            
            FirebaseHelper.sharedInstance.findARideWithParameters(from: (fromOutlet.titleLabel?.text)!, to: (toOutlet.titleLabel?.text)!, date: searchDate, pass: passOutlet.text!)
            
        }
    }
    

}
