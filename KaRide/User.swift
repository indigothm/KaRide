//
//  User.swift
//  KaRide
//
//  Created by Elliot Licht on 07/03/2017.
//  Copyright © 2017 Ilia Tikhomirov. All rights reserved.
//

import Foundation

class User {
    
    var FacebookID: String
    var Name: String
    var Photo: String
    
    init(id: String, name: String, photo: String) {
    
        self.FacebookID = id
        self.Name = name
        self.Photo = photo
        
    }
    
}
