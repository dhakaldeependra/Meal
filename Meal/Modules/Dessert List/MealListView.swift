//
//  ContentView.swift
//  Meal
//
//  Created by Deependra Dhakal on 5/17/23.
//

import SwiftUI

struct MealListView: View {
    
    @StateObject
    private var viewModel = MealsListViewModel()
    
    var body: some View {
        NavigationView{
            if let meals = viewModel.meals {
                List(meals, id: \.self.idMeal) { meal in
                    NavigationLink(destination: MealDetailView(mealID: meal.idMeal ?? "")){
                        MealItemView(meal: meal)
                    }.navigationBarTitle("Desserts")
                }
            }else {
                ProgressView()
            }
        }
        .onAppear{
            self.viewModel.getMeals()
        }
    }
}

struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
    }
}
