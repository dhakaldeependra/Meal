//
//  MealService.swift
//  Meal
//
//  Created by Deependra Dhakal on 11/4/23.
//

import Foundation

protocol MealServiceProtocol {
    func fetchMealList(request: MealRouter.GetMealList) async -> Result<MealListModel, APIError>
    func fetchMealDetails(request: MealRouter.GetMealDetails) async -> Result<MealListModel, APIError>
}

final class MealService: MealServiceProtocol {
    func fetchMealList(request: MealRouter.GetMealList) async -> Result<MealListModel, APIError> {
        let router = NetworkRouter(baseURL: APIConstants.baseURL)
        
        do {
            let result: Result<MealListModel, APIError> =  await router.executeRequest(request: request)
            return result
        }
    }
    
    func fetchMealDetails(request: MealRouter.GetMealDetails) async -> Result<MealListModel, APIError> {
        let router = NetworkRouter(baseURL: APIConstants.baseURL)
        
        do {
            let result: Result<MealListModel, APIError> =  await router.executeRequest(request: request)
            return result
        }
    }
}
