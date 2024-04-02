//
//  ResponseHandler.swift
//  coffee_shop
//
//  Created by TE-Member on 01/04/2024.
//

import Foundation

class ResponseHandler: NSObject {
    private var data: Data?
    private var response: URLResponse?
    private var error: Error?
    private var dataResponse: [String:Any]?
    
    init(data: Data?, response: URLResponse?, error: Error?) {
        self.data = data
        self.response = response
        self.error = error
        super.init()
    }
    
    var Error: Error? {
        return self.error
    }
    
    var HTTPResponse: HTTPURLResponse? {
        if let response = self.response as? HTTPURLResponse {
            return response
        }
        return nil
    }
    
    var statusCode: Int {
        return self.HTTPResponse?.statusCode ?? 400
    }
    
    var result: [String: Any]? {
        if(dataResponse != nil) {
            return dataResponse
        }
        do {
            let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any]
            dataResponse = json
            return dataResponse
        } catch {
            print("errorMsg: \(error)")
        }
        return [String: Any]()
    }
}
