//
//  Untitled.swift
//  ShapesRUS
//
//  Created by Brent Arnold on 5/14/25.
//
import Foundation

struct ShapesHTTPClient {
    
   func fetchInitialButtons() async throws -> [ShapesButton] {
       let (data, _) = try await URLSession.shared.data(from: URL(string: "https://staticcontent.cricut.com/static/test/shapes_001.json")!)
       var buttons = [ShapesButton]()
       struct SButtons: Decodable {
           let buttons: [ShapesButton]
       }
       do {
           buttons = try JSONDecoder().decode(SButtons.self, from: data).buttons
       } catch {
           print(String(describing: error))
       }
       return buttons
    }
}
