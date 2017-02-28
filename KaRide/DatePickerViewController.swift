//
//  DatePickerViewController.swift
//  KaRide
//
//  Created by Elliot Licht on 25/02/2017.
//  Copyright © 2017 Ilia Tikhomirov. All rights reserved.
//

import UIKit

protocol UpdateViewDelegateProtocol: class {
    func updateView()
}

class DatePickerViewController: UIViewController {
    
    var delegate: UpdateViewDelegateProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        datePicker.minimumDate = Date()
        
        let date = Calendar.current.date(byAdding: .month, value: 1, to: Date())
        datePicker.maximumDate = date

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var datePicker: UIDatePicker!

    @IBAction func shadowDidTouch(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func dismissDidTouch(_ sender: Any) {
        
         ProxiHelper.sharedInstance.offerDate =  datePicker.date
        
        if ProxiHelper.sharedInstance.origin == "offer" {
            
            ProxiHelper.sharedInstance.offerDate = datePicker.date
            
            if let delegateObj = delegate {
                
                delegateObj.updateView()
            }
            
        } else if ProxiHelper.sharedInstance.origin == "search" {
            
            ProxiHelper.sharedInstance.searchDate = datePicker.date
            
            if let delegateObj = delegate {
                
                delegateObj.updateView()
            }

            
        }
        
       
        
         dismiss(animated: true, completion: nil)
        
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
