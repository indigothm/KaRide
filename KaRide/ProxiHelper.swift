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
    
    //ride offer - main
    var offerFrom: String!
    var offerTo: String!
    var offerDate: Date!
    var offerPass: String!
    var offerPrice: String!
    
    //ride offer - details
    var offerDep: Date!
    var offerAr: Date!
    var offerModel: String!
    var offerContact: String!
    
    //ride search - params
    var searchFrom: String!
    var searchTo: String!
    var searchDate: Date!
    var searchPass: String!
    
}
