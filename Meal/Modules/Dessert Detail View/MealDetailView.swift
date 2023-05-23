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
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if let meal = viewModel.meal {
                // Header
                VStack(alignment: .center, spacing: 20) {
                    AsyncImage(url: URL(string: (meal.strMealThumb!))!, content: { image in
                        image.resizable()
                    }, placeholder: {
                        ProgressView()
                    })
                    .scaledToFit()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 350)
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    // Title
                    Text(meal.strMeal ?? "")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding(.top, 20)
                    
                    //Expandable ingredient view
                    MealIngredientsView(ingredients: meal.getIngredientsWithMeasurement)
                    
                    //Subtitle
                    Text("Instructions".uppercased())
                        .fontWeight(.bold)
                    
                    
                    // Instructions
                    Text(meal.strInstructions ?? "")
                        .multilineTextAlignment(.leading)
                    
                    
                    
                    //Youtube View
                    if let youtubeLink = meal.strYoutube?.extractYoutubeID() , !youtubeLink.isEmpty{
                        
                        Text("Watch on Youtube".uppercased())
                            .fontWeight(.bold)
                        
                        
                        YoutubeView(videoID: youtubeLink)
                            .frame(height: 200)
                            .cornerRadius(12)
                    }
                    
                    // Source View
                    if let sourceLink = meal.strSource, !sourceLink.isEmpty {
                        SourceLinkView(sourceLink: sourceLink)
                    }
                    
                }//: VStack
                .padding(20)
                .frame(maxWidth: 640, alignment: .center)
                
            }else {
                ProgressView()
            }
            
        }//: Scroll
        .edgesIgnoringSafeArea(.top)
        .navigationViewStyle(.stack)
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
