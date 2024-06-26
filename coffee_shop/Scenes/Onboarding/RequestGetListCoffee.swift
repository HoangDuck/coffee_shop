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
        return "/search.php"
    }
    
    var parameters: NSDictionary {
        return [
            "s":"coffee"
        ]
    }
    
    var headers: NSDictionary {
        return [:]
    }
}
