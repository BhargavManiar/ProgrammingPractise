//
//  Country.swift
//  Challenge-Day59
//
//  Created by Bhargav Maniar on 28/07/2021.
//

import Foundation

struct Country: Codable {
    var countryName: String
    var countryCapitalName: String
    var countryPopulation: Int          // E.g 100,000 people
}

// URL To Obtain JSON Data: https://restcountries.eu/rest/v2/all?fields=name;capital;region;currencies;population;alpha3Code
