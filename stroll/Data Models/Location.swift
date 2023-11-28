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
    var pictureId: Int
    var latitude: Double
    var longitude: Double
    
    init(name: String, info: String, pictureId: Int, latitude: Double, longitude: Double) {
        self.name = name
        self.info = info
        self.pictureId = pictureId
        self.latitude = latitude
        self.longitude = longitude
    }
}
