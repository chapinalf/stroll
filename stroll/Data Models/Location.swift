//
//  Location.swift
//  stroll
//
//  Created by Gigi Gillen on 11/28/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Location: Codable{
    @DocumentID var id: String?
    var name: String
    var info: String
    var photoURL: String
    var longitude: Double
    var latitude: Double
    
    init(name: String, info: String, photoURL: String, longitude: Double,  latitude: Double) {
        self.name = name
        self.info = info
        self.photoURL = photoURL
        self.longitude = longitude
        self.latitude = latitude
    }
}
