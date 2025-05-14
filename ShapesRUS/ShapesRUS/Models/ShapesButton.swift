//
//  ShapesButton.swift
//  ShapesRUS
//
//  Created by Brent Arnold on 5/14/25.
//
import Foundation
import SwiftData

@Model
class ShapesButton: Decodable {
    var name: String
    var drawPath: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case drawPath = "draw_path"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.drawPath = try container.decode(String.self, forKey: .drawPath)
    }
}
