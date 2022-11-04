//
//  Member.swift
//  NsGroupTravel
//
//  Created by Omar on 26/10/2022.
//

import Foundation

struct Member: Codable, Identifiable {
    var id, name, email, phoneNr: String
    var ticktesNr: Int
    var creator: Bool
}
