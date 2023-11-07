//
//  APIError.swift
//  Meal
//
//  Created by Deependra Dhakal on 11/4/23.
//

import Foundation

enum APIError: Error {
    case requestFailed(Error)
    case invalidData
    case decodingError
    case invalidURL
    case invalidResponse
    case invalidRequest
    case network

    // Add more error cases as per requirements
    
}


/* This extension is used for customise the error. There might have default error or user defined error.*/

extension APIError {

    func getErrorMessage() -> String {
        var errorString = "Unknown error"

        switch self {

        case let .requestFailed(error):
            errorString = error.localizedDescription
            
        case .invalidData:
            errorString = "invalid request."

        case .decodingError:
            errorString = "decoding request."

        case .invalidURL:
            errorString = "invalid request."

        case .invalidResponse:
            errorString = "invalid response."
            
        case .invalidRequest:
            errorString = "Request is invalid"

        case .network:
            errorString = "unknown network response."
        }

        return errorString

    }

}
