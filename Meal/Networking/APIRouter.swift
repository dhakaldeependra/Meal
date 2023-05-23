//
//  APIRouter.swift
//  Meal
//
//  Created by Deependra Dhakal on 5/17/23.
//

import Foundation

class APIRouter {
    
    // GET Request
    struct GetMealList: Request {
        typealias ReturnType = MealListModel
        var path: String = "/api/json/v1/1/filter.php"
        var method: HTTPMethod = .get
        var queryParams: [String : Any]?
        init(queryParams: APIParameters.MealListParams) {
            self.queryParams = queryParams.asDictionary
        }
    }
    
    struct GetMealDetails: Request {
        typealias ReturnType = MealListModel
        var path: String = "/api/json/v1/1/lookup.php"
        var method: HTTPMethod = .get
        var queryParams: [String : Any]?
        init(queryParams: APIParameters.MealDetailParams) {
            self.queryParams = queryParams.asDictionary
        }
    }
}
