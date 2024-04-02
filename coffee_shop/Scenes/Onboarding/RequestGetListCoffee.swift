//
//  RequestGetListCoffee.swift
//  coffee_shop
//
//  Created by TE-Member on 02/04/2024.
//

import Foundation

struct RequestGetListCoffee: RequestTemplate {
    var method: String {
        return "GET"
    }
    
    var path: String{
        return "/random.php"
    }
    
    var parameters: NSDictionary {
        return [:]
    }
    
    var headers: NSDictionary {
        return [
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
    }
    
    
}
