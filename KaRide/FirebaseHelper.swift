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
    
    func createRideOffer(from: String, to: String, date: Date, pass: String!, price: String, depTime: Date, arTime: Date, model: String, contact: String) {
        
        let userID = FIRAuth.auth()?.currentUser?.uid
        
        self.ref.child("rides").childByAutoId().setValue(
            
            [
                
                //TODO: CONVERT ALL THE DATES FROM PICKERS TO STRINGS BACK IN THE VIEWS 
                
                "driver": userID,
                "from": from,
                "to": to,
                "date": String(describing: date),
                "pass": pass,
                "price": price,
                "depTime": String(describing: depTime),
                "arTime": String(describing: arTime),
                "model": model,
                "contact": contact
            
            ])
        
    }
    
    
}
