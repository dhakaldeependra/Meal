//
//  MealDetailView.swift
//  Meal
//
//  Created by Deependra Dhakal on 11/4/23.
//

import SwiftUI

struct MealDetailView: View {
    //MARK: - Properties
    @ObservedObject
    var viewModel: MealDetailsViewModel
    
    //MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                } else if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .padding()
                } else {
                    // Header
                    if let link = viewModel.mealThumbLink {
                        VStack(alignment: .center, spacing: 20) {
                            AsyncImage(url: link, content: { image in
                                image.resizable()
                            }, placeholder: {
                                ProgressView()
                            })
                            .scaledToFit()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 350)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 20) {
                        // Title
                        Text(viewModel.mealTitle)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .padding(.top, 20)
                        
                        //Expandable ingredient view
                        MealIngredientsView(ingredients: viewModel.mealIngredients)
                        
                        //Subtitle
                        Text("Instructions".uppercased())
                            .fontWeight(.bold)
                        
                        
                        // Instructions
                        Text(viewModel.mealInstructions)
                            .multilineTextAlignment(.leading)
                        
                        
                        //Youtube View
                        if let youtubeLink = viewModel.youtubeLink, !youtubeLink.isEmpty{
                            
                            Text("Watch on Youtube".uppercased())
                                .fontWeight(.bold)
                            
                            
                            YoutubeView(videoID: youtubeLink)
                                .frame(height: 200)
                                .cornerRadius(12)
                        }
                        
                        // Source View
                        if let sourceLink = viewModel.mealSourceLink{
                            SourceLinkView(sourceLink: sourceLink)
                        }
                        
                    }//: VStack
                    .padding(20)
                    .frame(maxWidth: 640, alignment: .center)
                }//: Else
            }//: VStack
        }//: Scroll
        .edgesIgnoringSafeArea(.top)
        .navigationViewStyle(.stack)
    }
}

//MARK: - Preview
struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        if let mealId = MealMockModel.getMeal?.idMeal {
            return MealDetailView(viewModel: MealDetailsViewModel(mealId: mealId, service: MockMealService()))
        }
        return MealDetailView(viewModel: MealDetailsViewModel(mealId: "", service: MockMealService()))
    }
}
