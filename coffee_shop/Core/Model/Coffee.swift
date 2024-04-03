//
//  Coffee.swift
//  coffee_shop
//
//  Created by TE-Member on 03/04/2024.
//

import Foundation

struct ListDrinks: Decodable {
    let drinks: [Drink]?
}

struct Drink: Decodable {
    let idDrink, strDrink: String?
    let strDrinkAlternate, strTags, strVideo: String?
    let strCategory: String?
    let strIBA: String?
    let strAlcoholic, strGlass, strInstructions, strInstructionsES: String?
    let strInstructionsDE: String?
    let strInstructionsFR: String?
    let strInstructionsIT: String?
    let strInstructionsZHHANS, strInstructionsZHHANT: String?
    let strDrinkThumb: String?
    let strIngredient1, strIngredient2, strIngredient3, strIngredient4: String?
    let strIngredient5, strIngredient6, strIngredient7, strIngredient8: String?
    let strIngredient9, strIngredient10, strIngredient11, strIngredient12: String?
    let strIngredient13, strIngredient14, strIngredient15: String?
    let strMeasure1, strMeasure2, strMeasure3, strMeasure4: String?
    let strMeasure5, strMeasure6, strMeasure7, strMeasure8: String?
    let strMeasure9, strMeasure10, strMeasure11, strMeasure12: String?
    let strMeasure13, strMeasure14, strMeasure15, strImageSource: String?
    let strImageAttribution: String?
    let strCreativeCommonsConfirmed, dateModified: String?
}
