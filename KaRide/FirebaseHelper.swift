//
//  FirebaseHelper.swift
//  KaRide
//
//  Created by Elliot Licht on 25/02/2017.
//  Copyright © 2017 Ilia Tikhomirov. All rights reserved.
//

import Foundation
import Firebase


class FirebaseHelper {
    
    static let sharedInstance = FirebaseHelper()
    
    let ref = FIRDatabase.database().reference()
    
    func createRideOffer(from: String, to: String, date: String, pass: String!, price: String, depTime: String, arTime: String, model: String, contact: String) {
        
        let userID = FIRAuth.auth()?.currentUser?.uid
        
        self.ref.child("rides").childByAutoId().setValue(
            
            [
                
                //TODO: CONVERT ALL THE DATES FROM PICKERS TO STRINGS BACK IN THE VIEWS 
                
                "driver": userID,
                "from": from,
                "to": to,
                "date": date,
                "pass": pass,
                "price": price,
                "depTime": depTime,
                "arTime": arTime,
                "model": model,
                "contact": contact
            
            ])
        
    }
    
    func findARideWithParameters(from: String, to: String, date: String, pass: String ) {
        
        ref.child("rides").observeSingleEvent(of: .value, with: { (snapshot) in
            
            
            let rides = snapshot.value as? [String : AnyObject]
                        
            
            for ride in rides! {
                
                let rideData = ride.value as! [String: String]
                
                let rideDate = rideData["date"]
                let ridePass = rideData["pass"]
                let rideFrom = rideData["from"]
                let rideTo = rideData["to"]
            
                print(date)
                
                if rideDate == date && ridePass == pass && rideFrom ==  from && rideTo == to  {
                    print("match")
                    //return array of results
                }
                
                
                
            }
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    
    
}
