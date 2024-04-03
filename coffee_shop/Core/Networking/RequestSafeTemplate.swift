//
//  RequestSafeTemplate.swift
//  coffee_shop
//
//  Created by TE-Member on 01/04/2024.
//

import Foundation

class RequestSafeTemplate: NSObject {
    private var requestTemplate: RequestTemplate
    
    var template: RequestTemplate {
        return requestTemplate
    }
    
    init(requestTemplate: RequestTemplate) {
        self.requestTemplate = requestTemplate
    }
    
    var method: String {
        return requestTemplate.method
    }
    
    var isGetMethod: Bool {
        return requestTemplate.method == "GET"
    }
    
    var header: NSDictionary {
        return requestTemplate.headers
    }
    
    var baseUrl: URL {
        return URL(string: "https://www.thecocktaildb.com")!
    }
    
    var key: String {
        return "1"
    }
    
    var basePath: String {
        return "/api/json/v1/\(self.key)"
    }
    
    var path: String {
        return "\(self.basePath)\(requestTemplate.path)"
    }
    
    var parameters: NSDictionary {
        return requestTemplate.parameters
    }
    
}
