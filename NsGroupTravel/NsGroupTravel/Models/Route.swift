//
//  Route.swift
//  NsGroupTravel
//
//  Created by Omar on 26/10/2022.
//

import Foundation

struct Route {
    var id, departure, destination: String
    var groups: [Group] = []
}
