//
//  BreweryError.swift
//  breweries-list
//
//  Created by vladimir.kuzomenskyi on 7/2/20.
//  Copyright © 2020 vladimir.kuzomenskyi. All rights reserved.
//

import Foundation

enum BreweryError: Error {
    case noDataAvailable, cannotProcessData, serverOffline, incorrectToken, invalidQueryParameters, subscriptionRequired, unauthorized,
    custom(description: String)
}
