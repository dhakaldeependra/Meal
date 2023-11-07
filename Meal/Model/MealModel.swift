//
//  MealModel.swift
//  Meal
//
//  Created by Deependra Dhakal on 11/4/23.
//

import Foundation

struct MealListModel: Codable {
    var meals: [Meal]?
}

struct Meal: Codable{
    var idMeal: String?
    var strMeal: String?
    var strDrinkAlternate: String?
    var strCategory: String?
    var strArea: String?
    var strInstructions: String?
    var strMealThumb: String?
    var strTags: String?
    var strYoutube: String?
    var strSource: String?
    var strImageSource: String?
    var strCreativeCommonsConfirmed: String?
    var dateModified: String?
    var ingredientsWithMeasurement: [String : String]
    
    enum CodingKeys: String, CodingKey {
        case idMeal, strMeal, strDrinkAlternate, strCategory, strArea, strInstructions, strMealThumb, strTags, strYoutube, strSource, strImageSource, strCreativeCommonsConfirmed, dateModified
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.idMeal = try container.decodeIfPresent(String.self, forKey: .idMeal)
        self.strMeal = try container.decodeIfPresent(String.self, forKey: .strMeal)
        self.strDrinkAlternate = try container.decodeIfPresent(String.self, forKey: .strDrinkAlternate)
        self.strCategory = try container.decodeIfPresent(String.self, forKey: .strCategory)
        self.strArea = try container.decodeIfPresent(String.self, forKey: .strArea)
        self.strInstructions = try container.decodeIfPresent(String.self, forKey: .strInstructions)
        self.strMealThumb = try container.decodeIfPresent(String.self, forKey: .strMealThumb)
        self.strTags = try container.decodeIfPresent(String.self, forKey: .strTags)
        self.strYoutube = try container.decodeIfPresent(String.self, forKey: .strYoutube)
        self.strSource = try container.decodeIfPresent(String.self, forKey: .strSource)
        self.strImageSource = try container.decodeIfPresent(String.self, forKey: .strImageSource)
        self.strCreativeCommonsConfirmed = try container.decodeIfPresent(String.self, forKey: .strCreativeCommonsConfirmed)
        self.dateModified = try container.decodeIfPresent(String.self, forKey: .dateModified)
        
        // Decode dynamic strIngredient and strMeasure keys
        let dynamicKeysContainer = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var ingredientsDict = [String: String]()
        
        for i in 1...dynamicKeysContainer.allKeys.count {
            let ingredientKey = "strIngredient\(i)"
            let measurementKey = "strMeasure\(i)"
            
            if let ingredientCodingKey = DynamicCodingKeys(stringValue: ingredientKey),
               let measurementCodingKey = DynamicCodingKeys(stringValue: measurementKey),
               let ingredient = try dynamicKeysContainer.decodeIfPresent(String.self, forKey: ingredientCodingKey),
               let measurement = try dynamicKeysContainer.decodeIfPresent(String.self, forKey: measurementCodingKey),
               !ingredient.isEmpty,
               !measurement.isEmpty{
                ingredientsDict[ingredient] = measurement
            }
        }
        
        ingredientsWithMeasurement = ingredientsDict
    }
}

// Custom CodingKey to handle dynamic keys
struct DynamicCodingKeys: CodingKey {
    var stringValue: String
    
    init?(stringValue: String) {
        self.stringValue = stringValue
    }
    
    var intValue: Int?
    init?(intValue: Int) {
        return nil
    }
}

struct MealMockModel {
    static let getMeal: Meal? = {
        if let defaultData: MealListModel = readJSONFromFile(fileName: "MockMealDetailsData") {
            return defaultData.meals?.first
        } else {
            fatalError("Failed to load default data")
        }
    }()
}
