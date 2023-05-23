//
//  MealDetailsViewModel.swift
//  Meal
//
//  Created by Deependra Dhakal on 5/22/23.
//

import Foundation
import Combine

class MealDetailsViewModel: ObservableObject {
    
    @Published var meal: Meal?
    
    var cancelable: Set<AnyCancellable> = []
    
    func getMeal(with id: String) {
        APIClient.dispatch(
            APIRouter.GetMealDetails(queryParams: APIParameters.MealDetailParams(i: id)))
        .sink { _ in }
    receiveValue: { [weak self] results in
        self?.meal = results.meals?.first
    }.store(in: &cancelable)
        
    }
}
