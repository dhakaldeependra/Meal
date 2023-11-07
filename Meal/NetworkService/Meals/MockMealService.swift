//
//  MockMealService.swift
//  Meal
//
//  Created by Deependra Dhakal on 11/4/23.
//

import Foundation

class MockMealService: MealServiceProtocol {
    var result: Result<MealListModel, APIError>?
    
    func fetchMealList(request: MealRouter.GetMealList) async -> Result<MealListModel, APIError> {
        if let result = result {
            return result
        }
        
        guard let mealList = getMealListFromJSON() else {return .failure(.invalidData)}
        return .success(mealList)
    }
    
    func fetchMealDetails(request: MealRouter.GetMealDetails) async -> Result<MealListModel, APIError> {
        if let result = result {
            return result
        }
        
        guard let mealDetails = getMealDetailsFromJSON() else {return .failure(.invalidData)}
        return .success(mealDetails)
    }
    
    func getMealListFromJSON() -> MealListModel? {
        return readJSONFromFile(fileName: "MockMealListData")
    }
    
    func getMealDetailsFromJSON() -> MealListModel? {
        return readJSONFromFile(fileName: "MockMealDetailsData")
    }
}
