//
//  ContentView.swift
//  ShapesRUS
//
//  Created by Brent Arnold on 5/13/25.
//

import SwiftUI

struct ShapesGridView: View {
    
    @State private var shapesButtons: [ShapesButton] = []
    
    var body: some View {
        List (shapesButtons) { button in
            Text(button.name)
        }
        .task {
            do {
                let client = ShapesHTTPClient()
                shapesButtons = try await client.fetchInitialButtons()
            } catch {
                print(error.localizedDescription)
            }
            
        }
        .padding()
    }
}

#Preview {
    ShapesGridView()
}
