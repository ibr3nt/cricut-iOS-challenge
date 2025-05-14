//
//  SavedShape.swift
//  ShapesRUS
//
//  Created by Brent Arnold on 5/14/25.
//
import Foundation
import SwiftData

@Model
class SavedShape: Decodable {
    var shapePath: String
    
    enum CodingKeys: String, CodingKey {
        case shapePath = "shape_path"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.shapePath = try container.decode(String.self, forKey: .shapePath)
    }
    
    init (shapePath: String) {
        self.shapePath = shapePath
    }
}
