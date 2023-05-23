//
//  MealIngredientsView.swift
//  Meal
//
//  Created by Deependra Dhakal on 5/23/23.
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
                            Text(key)
                        }
                        .foregroundColor(.green)
                        .font(.system(.body).bold())
                        
                        Spacer(minLength: 25)
                        
                        Text(value)
                            .multilineTextAlignment(.trailing)
                    }//: HStack
                }
            }
        }//: Box
    }
}

//MARK: - Preview
struct MealIngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        MealIngredientsView(ingredients: ["Eggs" : "1"])
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 375, height: 480))
            .padding()
    }
}
