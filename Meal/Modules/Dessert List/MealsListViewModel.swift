//
//  MealsListViewModel.swift
//  Meal
//
//  Created by Deependra Dhakal on 5/17/23.
//

import Foundation
import Combine

class MealsListViewModel: ObservableObject {
    
    @Published var meals: [Meal]?
    
    var cancelable: Set<AnyCancellable> = []
    
    init() {
    }
    
    
    func getMeals() {
        APIClient.dispatch(
            APIRouter.GetMealList(queryParams: APIParameters.MealListParams(c: "Dessert")))
        .sink { _ in }
    receiveValue: { [weak self] results in
        self?.meals = results.meals?.sorted{$0.strMeal ?? "" < $1.strMeal ?? ""}
    }.store(in: &cancelable)
        
    }
}
