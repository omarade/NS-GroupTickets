//
//  GroupDto.swift
//  NsGroupTravel
//
//  Created by Omar on 04/11/2022.
//

import Foundation

struct GroupDto: Codable, Identifiable {
    var id, departure, destination, date: String
    var freeSpots: Int
    var members: [Member] = []
}
