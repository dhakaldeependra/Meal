//
//  MealsListViewModelTests.swift
//  MealTests
//
//  Created by Deependra Dhakal on 5/23/23.
//

import XCTest
import Combine
@testable import Meal

final class MealsListViewModelTests: XCTestCase {
    func testMealsListNotEmpty() {
        //Given
        let viewModel = MealsListViewModel()
        
        var cancelable: Set<AnyCancellable> = []
        
        let expectation = XCTestExpectation(description: "Dessert list not empty")
        
        viewModel.$meals
            .sink(receiveValue: { meals in
                // Fulfill the expectation
                if let meals = meals, !meals.isEmpty {
                    expectation.fulfill()
                }
            })
            .store(in: &cancelable)
        
        //When
        viewModel.getMeals()
        
        //Then
        wait(for: [expectation], timeout: 5)
    }
    
}
