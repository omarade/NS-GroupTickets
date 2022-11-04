//
//  Group.swift
//  NsGroupTravel
//
//  Created by Omar on 26/10/2022.
//

import Foundation

struct Group: Codable, Identifiable {
    var id: String
    var freeSpots: Int
    var createdBy: [String: String]
    var date: String
}
