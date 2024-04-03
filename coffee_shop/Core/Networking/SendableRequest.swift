//
//  SendableRequest.swift
//  coffee_shop
//
//  Created by TE-Member on 01/04/2024.
//

import Foundation

class SendableRequest<T: Decodable>:NSObject {
    private var requestBuilder: RequestBuilder
    
    init(requestTemplate: RequestTemplate) {
        self.requestBuilder = RequestBuilder(requestTemplate: requestTemplate)
        super.init()
    }
    
    var template: RequestTemplate {
        return self.requestBuilder.template
    }
    
    func send(successCallback:@escaping (Any) -> Void,_ errorCallback:@escaping (Error) -> Void){
        let urlSession = URLSession.shared
        urlSession.dataTask(with: self.requestBuilder.urlRequest) {
            data, response, error in
            let responseHandler: ResponseHandler<T> = ResponseHandler<T>(data: data, response: response, error: error)
            if ((responseHandler.Error) != nil) {
                errorCallback(responseHandler.Error!)
            } else if (data != nil){
                successCallback(responseHandler.result ?? [T]())
            }
        }.resume()
    }
}
