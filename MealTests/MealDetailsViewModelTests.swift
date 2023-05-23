//
//  MealDetailsViewModelTests.swift
//  MealTests
//
//  Created by Deependra Dhakal on 5/23/23.
//

import XCTest
import Combine
@testable import Meal

final class MealDetailsViewModelTests: XCTestCase {

    func testFetchMealDetails() {
        //Given
        let viewModel =  MealDetailsViewModel()
        
        var cancelable: Set<AnyCancellable> = []
        
        let expectation = XCTestExpectation(description: "Fetch Desert Details")
        
        viewModel.$meal
            .sink(receiveValue: { meal in
                // Fulfill the expectation
                if meal != nil {
                    expectation.fulfill()
                }
            })
            .store(in: &cancelable)
        
        //When
        viewModel.getMeal(with: "53049")
        
        //Then
        wait(for: [expectation], timeout: 5)
    }
    
    func testGetIngredientsWithMeasurement() {
        //Given
        let viewModel =  MealDetailsViewModel()
        
        var cancelable: Set<AnyCancellable> = []
        
        let expectation = XCTestExpectation(description: "Test if ingredients is mapped correctly with measurements")
        
        viewModel.$meal
            .sink(receiveValue: { meal in
                // Fulfill the expectation
                if let meal = meal {
                    //Testing if this is mapped correctly
                    let ingreWithMeasurement = meal.getIngredientsWithMeasurement
                    
                    //Taking first ingradient and first measurement
                    let firstIngredient = meal.strIngredient1
                    let firstMeasurement = meal.strMeasure1
                    
                    //Finding firstIngradient in mapped dictionary
                    let findIngredient = ingreWithMeasurement.first{$0.key == firstIngredient}
                    
                    //Checking if firstIngredient measurement match
                    if findIngredient?.value == firstMeasurement {
                        expectation.fulfill()
                    }
                    
                }
            })
            .store(in: &cancelable)
        
        //When
        viewModel.getMeal(with: "53049")
        
        //Then
        wait(for: [expectation], timeout: 5)
    }

}
