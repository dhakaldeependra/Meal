//
//  MealItemView.swift
//  Meal
//
//  Created by Deependra Dhakal on 5/22/23.
//

import SwiftUI

struct MealItemView: View {
    
    let meal: Meal
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: meal.strMealThumb!), content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
            }, placeholder: {
                ProgressView()
            })
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            
            
            Text(meal.strMeal ?? "")
                .font(.headline)
            
        }.padding(.top,8).padding(.bottom)
    }
}

struct MealItemView_Previews: PreviewProvider {
    static var previews: some View {
        MealItemView(meal: Meal())
    }
}
