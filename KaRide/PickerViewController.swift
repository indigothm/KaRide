//
//  PickerViewController.swift
//  KaRide
//
//  Created by Elliot Licht on 25/02/2017.
//  Copyright © 2017 Ilia Tikhomirov. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var delegate: UpdateViewDelegateProtocol?
    
    var prices = [String]()
    var passangers = ["1","2"]
    var requestType = "price"
    var pickerData = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...50 {
            prices.append("$\(i)")
        }


        // Do any additional setup after loading the view.
        if requestType == "price" {
            pickerData = prices
        } else if requestType == "pass" {
            pickerData = passangers
        }
        

        picker.delegate = self
        picker.dataSource = self
        

    }
    
    
    // The number of columns of data

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
     // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count;
    }
    
     // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print(pickerData[row])
        return pickerData[row]
    }
    
    var valueSelected: String!
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.valueSelected = pickerData[row] as String
        print(self.valueSelected)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBAction func shadowDidTouch(_ sender: Any) {
        
        //dismiss selection
        dismiss(animated: true, completion: nil)
        
    }

    @IBAction func doneDidTouch(_ sender: Any) {
        
        print(ProxiHelper.sharedInstance.origin)
        print(self.requestType)
        
        if ProxiHelper.sharedInstance.origin == "offer" && self.requestType == "price" {
            
            if let val = valueSelected {
                ProxiHelper.sharedInstance.offerPrice = val
            }
            
        } else if ProxiHelper.sharedInstance.origin == "offer" && self.requestType == "pass" {
            
            if let val = valueSelected {
                ProxiHelper.sharedInstance.offerPass = val
            }
            
        }
        
        if let delegateObj = delegate {
            
            delegateObj.updateView()
        }


         //save result
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
