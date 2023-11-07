//
//  APIParameters.swift
//  Meal
//
//  Created by Deependra Dhakal on 11/4/23.
//

import Foundation

//MARK: APIParameters for using in URLrequests
/// Structs that containg all parameters that needed for passing data as body or queary strings to urlrequest
struct MealParameters{
    
    struct MealListParams: Encodable  {
        var c: String?
    }
    
    struct MealDetailParams: Encodable {
        var i: String?
    }
}
