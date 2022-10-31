//
//  Group.swift
//  NsGroupTravel
//
//  Created by Omar on 26/10/2022.
//

import Foundation

struct Group: Codable, Identifiable {
    var id: String
//    var id: String = UUID().uuidString
//    var departure, destination: String
    var freeSpots: Int
    //var members: [String:  Member]
    var createdBy: [String: String]
    var date: String
}
