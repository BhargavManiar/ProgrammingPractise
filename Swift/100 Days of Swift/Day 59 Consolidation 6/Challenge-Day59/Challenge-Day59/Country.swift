//
//  Country.swift
//  Challenge-Day59
//
//  Created by Bhargav Maniar on 28/07/2021.
//

import Foundation

struct Country: Codable {
    var name: String
    var capital: String
    var population: Int          // E.g 100,000 people
    var region: String           // E.g Europe
    var currencies: [Currency]
}

struct Currency: Codable {
    let code, name, symbol: String?
}

// URL To Obtain JSON Data: https://restcountries.eu/rest/v2/all?fields=name;capital;region;currencies;population;alpha3Code
