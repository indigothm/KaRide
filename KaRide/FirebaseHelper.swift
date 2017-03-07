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
    
    func getUserFromID(id: String, callback: @escaping (User) -> Void) {
    
        ref.child("Users").child(id).child("Public").observeSingleEvent(of: .value, with: { (snapshot) in
            
            let output = snapshot.value as! [String : AnyObject]
            let user = User(id: output["FacebookID"] as! String, name: output["name"] as! String, photo: output["photo"] as! String)
            
            callback(user)
            
            
            
        })
    }
    
    func findARideWithParameters(from: String, to: String, date: String, pass: String, callback: @escaping ( _ s: Bool,
        _ r: [Ride]) -> Void) {
        
        ref.child("rides").observeSingleEvent(of: .value, with: { (snapshot) in
            
            
            let rides = snapshot.value as? [String : AnyObject]
            
            var results = [Ride]()
                        
            
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
                    
                    let newRide = Ride(
                        
                        from: rideFrom!,
                        to: rideTo!,
                        date: rideDate!,
                        pass: ridePass!,
                        depTime: rideData["depTime"]!,
                        arTime: rideData["arTime"]!,
                        model: rideData["model"]!,
                        price: rideData["price"]!,
                        contact: rideData["contact"]!,
                        driver: rideData["driver"]!
                    
                    )
                    
                    results.append(newRide)
                    
                }
               
                
            }
            
            if results.count == 0 {
                print("no match")
                callback(false, [])
            } else {
                callback(true, results)
            }
            
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    
    
}
