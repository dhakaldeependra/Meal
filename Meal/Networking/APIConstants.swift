//
//  APIConstants.swift
//  Meal
//
//  Created by Deependra Dhakal on 5/17/23.
//

import Foundation

final class APIConstants {
    static var baseURL: String = "https://themealdb.com"
}

enum HTTPHeaderField: String {
    case authentication = "Authentication"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case authorization = "Authorization"
    case acceptLanguage = "Accept-Language"
    case userAgent = "User-Agent"
}

enum ContentType: String {
    case json = "application/json"
    case xwwwformurlencoded = "application/x-www-form-urlencoded"
}
