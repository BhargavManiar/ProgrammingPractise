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
    var countrySize: Int                // E.g 1,000,000 m^2
    var countryPrimaryLanguage: String
}

// URL To Obtain JSON Data: https://restcountries.eu/rest/v2/all?fields=name;capital;region;currencies;population;alpha3Code
