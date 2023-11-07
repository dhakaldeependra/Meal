//
//  MealsListViewModelTests.swift
//  MealTests
//
//  Created by Deependra Dhakal on 11/4/23.
//

import XCTest
import Combine
@testable import Meal

final class MealsListViewModelTests: XCTestCase {
    func testMealsListNotEmpty() async {
        // Given
        let viewModel = MealsListViewModel(service: MockMealService())

        // When
        await viewModel.fetchMeals()

        // Then
        XCTAssertTrue(!viewModel.meals.isEmpty, "Meals should not be empty")
        XCTAssertFalse(viewModel.isLoading, "isLoading should be false")
        XCTAssertTrue(viewModel.errorMessage.isEmpty, "errorMessage should be empty")
    }
    
    func testAPIFailure() async {
        // Given
        let mockService = MockMealService()
        mockService.result = .failure(.invalidData)
        let viewModel = MealsListViewModel(service: mockService)

        // When
        await viewModel.fetchMeals()

        // Then
        XCTAssertTrue(viewModel.meals.isEmpty, "Meals should be empty")
        XCTAssertFalse(viewModel.isLoading, "isLoading should be false")
        XCTAssertFalse(viewModel.errorMessage.isEmpty, "errorMessage should not be empty")
    }
    
}
