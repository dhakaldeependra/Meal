//
//  MealDetailsViewModelTests.swift
//  MealTests
//
//  Created by Deependra Dhakal on 11/4/23.
//

import XCTest
import Combine
@testable import Meal

final class MealDetailsViewModelTests: XCTestCase {

    func testFetchMealDetails() async {
        //Given
        let mockMealID = MealMockModel.getMeal?.idMeal
        let viewModel =  MealDetailsViewModel(mealId: mockMealID!, service: MockMealService())
        
        // When
        await viewModel.fetchMealDetails()

        // Then
        XCTAssertTrue(viewModel.meal != nil, "Meal should not be nil")
        XCTAssertFalse(viewModel.isLoading, "isLoading should be false")
        XCTAssertTrue(viewModel.errorMessage.isEmpty, "errorMessage should be empty")
    }
    
    func testAPIFailure() async {
        // Given
        let mockService = MockMealService()
        let mockMealID = MealMockModel.getMeal?.idMeal
        mockService.result = .failure(.invalidData)
        let viewModel = MealDetailsViewModel(mealId: mockMealID!, service: mockService)

        // When
        await viewModel.fetchMealDetails()

        // Then
        XCTAssertTrue(viewModel.meal == nil, "Meals should be empty")
        XCTAssertFalse(viewModel.isLoading, "isLoading should be false")
        XCTAssertFalse(viewModel.errorMessage.isEmpty, "errorMessage should not be empty")
    }
}
