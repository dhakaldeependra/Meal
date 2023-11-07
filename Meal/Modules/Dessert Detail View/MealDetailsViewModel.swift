//
//  MealDetailsViewModel.swift
//  Meal
//
//  Created by Deependra Dhakal on 11/4/23.
//

import Foundation
import Combine

class MealDetailsViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""
    
    @Published var mealThumbLink: URL? = nil
    @Published var mealTitle: String = ""
    @Published var mealIngredients: [String: String] = [:]
    @Published var mealInstructions: String = ""
    @Published var youtubeLink: String? = nil
    @Published var mealSourceLink: URL? = nil
    
    @Published var meal: Meal?
    private let service: MealServiceProtocol
    private let mealId: String
    
    
    init(mealId: String, service: MealServiceProtocol) {
        self.mealId = mealId
        self.service = service
        
        Task {
            await fetchMealDetails()
        }
    }
    
    @MainActor func fetchMealDetails() async {
        isLoading = true
        
        let result =  await service.fetchMealDetails(request: MealRouter.GetMealDetails(queryParams: MealParameters.MealDetailParams(i: mealId)))
        switch result {
        case .success(let data):
            // Handle the successful case with the model
            if let meal = data.meals?.first {
                self.meal = meal
                populateData()
            }else {
                errorMessage = "No Data"
            }
            isLoading = false
            
        case .failure(let error):
            // Handle the APIError in the failure case
            self.errorMessage = "Failed to fetch posts: \(error.getErrorMessage())"
            isLoading = false
            
        }
        
    }
    
    private func populateData() {
        if let mealThumb = meal?.strMealThumb {
            mealThumbLink = URL(string: mealThumb)
        }
        
        mealTitle = meal?.strMeal ?? ""
        mealIngredients = meal?.ingredientsWithMeasurement ?? [:]
        mealInstructions = meal?.strInstructions ?? ""
        youtubeLink = meal?.strYoutube?.extractYoutubeID()
        
        if let mealSource = meal?.strSource {
            mealSourceLink = URL(string: mealSource)
        }
        
    }
}
