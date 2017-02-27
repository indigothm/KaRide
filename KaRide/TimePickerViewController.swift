//
//  TimePickerViewController.swift
//  KaRide
//
//  Created by Elliot Licht on 26/02/2017.
//  Copyright © 2017 Ilia Tikhomirov. All rights reserved.
//

import UIKit


class TimePickerViewController: UIViewController {
    
    var delegate: UpdateViewDelegateProtocol?
    
    var requestType = "Ar"

    @IBOutlet weak var picker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func shadowDidTouch(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func dismissDidTouch(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
        if requestType == "Ar" {
        
           ProxiHelper.sharedInstance.offerAr = picker.date
            
        } else if requestType == "Dep" {
        
            ProxiHelper.sharedInstance.offerDep = picker.date
            
        }
        
        if let delegateObj = delegate {
            
            delegateObj.updateView()
            
        }
        
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
