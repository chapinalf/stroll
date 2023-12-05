//
//  User.swift
//  stroll
//
//  Created by Chapin Alf on 11/19/23.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable{
    @DocumentID var id: String?
    var name: String
    var phoneNumber: Int
    var city: String
    var strollsTotal: Int
    var strollsStreak: Int
    var milesTotal: Double
    var milesStreak: Double
    var lastStrollDate: String
    
    init(name: String, phoneNumber: Int, city: String, strollsTotal: Int, strollsStreak: Int, milesTotal: Double, milesStreak: Double, lastStrollDate: String) {
        self.name = name
        self.phoneNumber = phoneNumber
        self.city = city
        self.strollsTotal = strollsTotal
        self.strollsStreak = strollsStreak
        self.milesTotal = milesTotal
        self.milesStreak = milesStreak
        self.lastStrollDate = lastStrollDate
    }
}
