//
//  Brewery.swift
//  breweries-list
//
//  Created by vladimir.kuzomenskyi on 7/1/20.
//  Copyright © 2020 vladimir.kuzomenskyi. All rights reserved.
//

import Foundation

struct Brewery: Codable {
    let id: Int?
    let name, breweryType, street, city: String?
    let state, postalCode, country, longitude: String?
    let latitude, phone: String?
    let websiteURL: String?
    let updatedAt: String?
    let tagList: [String]?

    enum CodingKeys: String, CodingKey {
        case id, name
        case breweryType = "brewery_type"
        case street, city, state
        case postalCode = "postal_code"
        case country, longitude, latitude, phone
        case websiteURL = "website_url"
        case updatedAt = "updated_at"
        case tagList = "tag_list"
    }
}
