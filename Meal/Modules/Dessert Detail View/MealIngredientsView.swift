//
//  MealIngredientsView.swift
//  Meal
//
//  Created by Deependra Dhakal on 11/4/23.
//

import SwiftUI

struct MealIngredientsView: View {
    //MARK: - Properties
    var ingredients: [String:String]
    
    //MARK: - Body
    var body: some View {
        GroupBox() {
            DisclosureGroup("Ingredients") {
                ForEach(ingredients.sorted(by: >), id: \.key) { key, value in
                    Divider()
                        .padding(.vertical, 2)
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            
                            // Ingredients Title
                            Text(key)
                        }
                        .foregroundColor(.green)
                        .font(.system(.body).bold())
                        
                        Spacer(minLength: 25)
                        
                        //Ingredients Measurements
                        Text(value)
                            .multilineTextAlignment(.trailing)
                    }//: HStack
                }//: ForEach
            }//: Disclosure Group
        }//: Box
    }
}

//MARK: - Preview
struct MealIngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        let mockMeal = MealMockModel.getMeal?.ingredientsWithMeasurement ?? ["Eggs" : "1"]
        MealIngredientsView(ingredients: mockMeal)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 375, height: 480))
            .padding()
    }
}
