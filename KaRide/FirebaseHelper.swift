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
    
    
    
}
