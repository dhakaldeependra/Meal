//
//  NavigationLazyView.swift
//  Meal
//
//  Created by Deependra Dhakal on 11/5/23.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}
