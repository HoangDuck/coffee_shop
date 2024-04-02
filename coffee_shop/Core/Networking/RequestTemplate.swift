//
//  RequestTemplate.swift
//  coffee_shop
//
//  Created by TE-Member on 01/04/2024.
//

import Foundation

protocol RequestTemplate {
    var method: String { get }
    var path: String { get }
    var parameters: NSDictionary { get }
    var headers: NSDictionary { get }
}
