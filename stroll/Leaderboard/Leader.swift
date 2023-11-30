//
//  Leader.swift
//  stroll
//
//  Created by Zaneer Mitha on 11/16/23.
//

import Foundation

struct Leader: Codable{
    var name: String?
    var strollsTotal: Int?
    var strollsStreak: Int?
    
    init(name: String? = nil, strollsTotal: Int? = nil, strollsStreak: Int? = nil) {
        self.name = name
        self.strollsTotal = strollsTotal
        self.strollsStreak = strollsStreak
    }
    
}
