//
//  YoutubeView.swift
//  Meal
//
//  Created by Deependra Dhakal on 5/23/23.
//

import SwiftUI

struct SourceLinkView: View {
    //MARK: - Properties
    
    let sourceLink: String
    
    //MARK: - Body
    var body: some View {
        GroupBox() {
            HStack {
                Text("Content Source ")
                
                Spacer()
                
                Link("Visit Site", destination: URL(string: sourceLink)!)
                    .foregroundColor(.blue)
                Image(systemName: "arrow.up.right.square")
            }//: HStack
            .font(.footnote)
        }//: Groupbox
    }
}

//MARK: - Preview
struct SourceLinkView_Previews: PreviewProvider {
    static var previews: some View {
        SourceLinkView(sourceLink: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
