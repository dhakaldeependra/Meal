//
//  MealItemView.swift
//  Meal
//
//  Created by Deependra Dhakal on 5/22/23.
//

import SwiftUI

struct MealItemView: View {
    //MARK: - Properties
    let meal: Meal
    
    //MARK: - Body
    var body: some View {
        HStack {
            //Meal Image
            AsyncImage(url: URL(string: meal.strMealThumb ?? ""), content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
            }, placeholder: {
                ProgressView()
            })
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            
            //Meal Title
            Text(meal.strMeal ?? "")
                .font(.headline)
            
        }//: HStack
        .padding(.top,8).padding(.bottom)
    }
}

//MARK: - Preview
struct MealItemView_Previews: PreviewProvider {
    static var previews: some View {
        let mockMeal = MealMockModel.getMeal
        MealItemView(meal: mockMeal!)
    }
}
