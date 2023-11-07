//
//  MealsListViewModel.swift
//  Meal
//
//  Created by Deependra Dhakal on 11/4/23.
//

import Foundation
import Combine

class MealsListViewModel: ObservableObject {
    
    @Published var meals: [Meal] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""
    
    private let service: MealServiceProtocol
    
    init(service: MealServiceProtocol) {
        self.service = service
        
        Task {
            await fetchMeals()
        }
    }
    
    @MainActor func fetchMeals() async {
        isLoading = true
        
        let result =  await service.fetchMealList(request: MealRouter.GetMealList(queryParams: MealParameters.MealListParams(c: "Dessert")))
        switch result {
        case .success(let data):
            // Handle the successful case with the meals model
            self.meals = data.meals ?? []
            isLoading = false
            
        case .failure(let error):
            // Handle the APIError in the failure case
            self.errorMessage = "Failed to fetch posts: \(error.getErrorMessage())"
            isLoading = false
            
        }
    }
}
