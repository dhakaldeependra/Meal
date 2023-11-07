//
//  String+Extension.swift
//  Meal
//
//  Created by Deependra Dhakal on 11/4/23.
//

import Foundation

extension String {
    func extractYoutubeID() -> String? {
        let pattern = "((?<=(v|V)/)|(?<=be/)|(?<=(\\?|\\&)v=)|(?<=embed/))([\\w-]++)"
        
        let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let range = NSRange(location: 0, length: self.count)
        
        guard let result = regex?.firstMatch(in: self, range: range) else { return nil }
        return (self as NSString).substring(with: result.range)
    }
}
