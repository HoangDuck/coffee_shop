//
//  RequestTemplate.swift
//  coffee_shop
//
//  Created by TE-Member on 01/04/2024.
//

import Foundation

protocol RequestTemplate {
    var method: String { get set }
    var path: String { get set }
    var parameters: NSDictionary { get set }
    var headers: NSDictionary { get set }
}
