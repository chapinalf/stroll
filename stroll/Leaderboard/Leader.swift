//
//  Leader.swift
//  stroll
//
//  Created by Zaneer Mitha on 11/16/23.
//

import Foundation

struct Leader{
    var name: String?
    var strolls: Int?
    var streak: Int?
    
    init(name: String? = nil, strolls: Int? = nil, streak: Int? = nil) {
        self.name = name
        self.strolls = strolls
        self.streak = streak
    }
    
}
