//
//  YoutubeView.swift
//  Meal
//
//  Created by Deependra Dhakal on 11/4/23.
//

import SwiftUI

struct SourceLinkView: View {
    //MARK: - Properties
    
    let sourceLink: URL
    
    //MARK: - Body
    var body: some View {
        GroupBox() {
            HStack {
                Text("Content Source ")
                
                Spacer()
                
                Link("Visit Site", destination: sourceLink)
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
        SourceLinkView(sourceLink: URL(string: "https://www.google.com")!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
