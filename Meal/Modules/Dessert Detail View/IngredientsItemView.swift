//
//  IngredientsItemView.swift
//  Meal
//
//  Created by Deependra Dhakal on 5/22/23.
//

import SwiftUI

struct IngredientsItemView: View {
    
    let ingredient: String
    let measurement: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Text(ingredient)
            Spacer()
            Text(measurement)
        }
        .padding(12)
    }
}

struct IngredientsItemView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsItemView(ingredient: "Milk", measurement: "200ml")
            .previewLayout(.sizeThatFits)
    }
}
