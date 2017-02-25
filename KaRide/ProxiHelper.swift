//
//  ProxiHelper.swift
//  KaRide
//
//  Created by Elliot Licht on 25/02/2017.
//  Copyright © 2017 Ilia Tikhomirov. All rights reserved.
//

import Foundation

class ProxiHelper {
    
    static let sharedInstance = ProxiHelper()
    
    //nav header proxi
    var targetPage = ""
    var origin = ""
    
    //ride offer temp 
    var offerFrom: String!
    var offerTo: String!
    var offerDate: String!
    var offerPass: String!
    var offerPrice: String!
    
}
