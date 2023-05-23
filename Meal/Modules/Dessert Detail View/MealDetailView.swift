//
//  MealDetailView.swift
//  Meal
//
//  Created by Deependra Dhakal on 5/22/23.
//

import SwiftUI

struct MealDetailView: View {
    
    @StateObject
    private var viewModel = MealDetailsViewModel()
    
    let mealID: String
    
    init(mealID: String) {
        self.mealID = mealID
        UILabel.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).adjustsFontSizeToFitWidth = true
    }
    
    var body: some View {
        ZStack {
            if let meal = viewModel.meal {
                List{
                    AsyncImage(url: URL(string: (meal.strMealThumb!))!, content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(12)
                    }, placeholder: {
                        ProgressView()
                    })
                    .frame(height: 300)
                    .padding(.vertical, 35)
                    
                    Text("Ingredients")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    ForEach(meal.getIngredientsWithMeasurement.sorted(by: >), id: \.key) { key, value in
                        IngredientsItemView(ingredient: key, measurement: value)
                    }
                }.navigationBarTitle(meal.strMeal ?? "")
                
            }else {
                ProgressView()
            }
        }
        .onAppear{
            self.viewModel.getMeal(with: mealID)
        }
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(mealID: "53049")
    }
}
