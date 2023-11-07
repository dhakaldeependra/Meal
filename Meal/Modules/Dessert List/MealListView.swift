//
//  ContentView.swift
//  Meal
//
//  Created by Deependra Dhakal on 11/4/23.
//

import SwiftUI

struct MealListView: View {
    
    //MARK: - Properties
    @ObservedObject
    var viewModel: MealsListViewModel = MealsListViewModel(service: MealService())
    
    //MARK: - Body
    var body: some View {
        NavigationView{
            VStack{
                
                // Show loading, error message if present during API Calls
                if viewModel.isLoading {
                    ProgressView()
                } else if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .padding()
                } else {
                    //Meal List
                    List(viewModel.meals, id: \.self.idMeal) { meal in
                        NavigationLink(
                            destination: NavigationLazyView(
                                MealDetailView(
                                    viewModel: MealDetailsViewModel(
                                        mealId: meal.idMeal ?? "",
                                        service: MealService()))
                            )
                        )
                        {
                            //List Item View
                            MealItemView(meal: meal)
                        }.navigationBarTitle("Desserts")
                    }//: List View
                }//: Else Condition
            }//: VStack
        }//: NavitaionView
    }
}

//MARK: - Preview
struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView(viewModel: MealsListViewModel(service: MockMealService()))
    }
}
