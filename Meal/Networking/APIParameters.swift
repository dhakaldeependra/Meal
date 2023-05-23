//
//  APIParameters.swift
//  Meal
//
//  Created by Deependra Dhakal on 5/17/23.
//

import Foundation

protocol DictionaryConvertor: Codable {}


//MARK: APIParameters for using in URLrequests
/// Structs that containg all parameters that needed for passing data as body or queary strings to urlrequest
/// it is conforimig to DictionaryConvertor
struct APIParameters{
    
    struct MealListParams: Encodable  {
        var c: String?
    }
    
    struct MealDetailParams: Encodable {
        var i: String?
    }
}
