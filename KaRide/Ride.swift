//
//  Ride.swift
//  KaRide
//
//  Created by Elliot Licht on 05/03/2017.
//  Copyright © 2017 Ilia Tikhomirov. All rights reserved.
//

import Foundation

class Ride {
    
    var to: String
    var depTime: String
    var from: String
    var contact: String
    var driver: String
    var arTime: String
    var pass: String
    var date: String
    var model: String
    var price: String
    
    init(
        from: String,
        to: String,
        date: String,
        pass: String,
        depTime: String,
        arTime: String,
        model: String,
        price: String,
        contact: String,
        driver: String ) {
        
        self.to = to
        self.from = from
        self.date = date
        self.pass = pass
        self.depTime = depTime
        self.arTime = arTime
        self.model = model
        self.price = price
        self.contact = contact
        self.driver = driver
    
    }
    
}
