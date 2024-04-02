//
//  RequestBuilder.swift
//  coffee_shop
//
//  Created by TE-Member on 01/04/2024.
//

import Foundation

class RequestBuilder: NSObject {
    
    private var safeRequestTemplate: RequestSafeTemplate
    
    var template: RequestTemplate {
        return safeRequestTemplate.template
    }
    
    init(requestTemplate: RequestTemplate) {
        self.safeRequestTemplate = RequestSafeTemplate(requestTemplate: requestTemplate)
    }
    
    var allHeaders: NSDictionary {
        let headers: NSDictionary = self.safeRequestTemplate.header.copy() as! NSDictionary
        return headers
    }
    
    var URL: URL {
        var urlComponents = URLComponents(url: self.safeRequestTemplate.baseUrl, resolvingAgainstBaseURL: true)
        urlComponents?.path = self.safeRequestTemplate.path
        return urlComponents?.url ?? self.safeRequestTemplate.baseUrl
    }
    
    var urlRequest: URLRequest {
        var urlRequest = URLRequest(url: self.URL)
        urlRequest.httpMethod = self.template.method
        self.allHeaders.enumerateKeysAndObjects() {
            field, value, _ in
            urlRequest.addValue(value as! String, forHTTPHeaderField: field  as! String)
        }
        return urlRequest
    }
    
}
