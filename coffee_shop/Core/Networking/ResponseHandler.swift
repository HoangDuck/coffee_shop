//
//  ResponseHandler.swift
//  coffee_shop
//
//  Created by TE-Member on 01/04/2024.
//

import Foundation

class ResponseHandler<T:Decodable>: NSObject {
    private var data: Data?
    private var response: URLResponse?
    private var error: Error?
    private var dataResponse: T?
    
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
    
    var result: T? {
        if(dataResponse != nil) {
            return dataResponse
        }
        do {
            let jsonDecoder = JSONDecoder()
            let json = try jsonDecoder.decode(T.self, from: data!)
            dataResponse = json
            return dataResponse
        } catch {
            print("errorMsg: \(error)")
        }
        return nil
    }
}
