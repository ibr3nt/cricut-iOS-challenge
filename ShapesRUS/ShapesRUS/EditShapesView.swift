//
//  EditShapesView.swift
//  ShapesRUS
//
//  Created by Brent Arnold on 5/14/25.
//

import SwiftUI
import SwiftData

struct EditShapesView: View {
    
    @EnvironmentObject private var selectedShape: SelectedShape
    @EnvironmentObject private var savedShapesArray: SavedShapesArray
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                // Filter array for selectedShape.item
                let filteredShapes = savedShapesArray.savedShapes.filter { $0.shapePath == selectedShape.item }
                
                ForEach(filteredShapes, id: \.self) { savedShape in
                    Image(systemName: "\(savedShape.shapePath).fill")
                        .font(.system(size: 100))
                        .foregroundStyle(.teal)
                        .frame(width: 100, height: 100)
                }
            }
        }
        .safeAreaInset(edge: .bottom) {
            HStack {
                Spacer()
                
                Button("Delete All") {
                    
                }
                Spacer()
                Button("Add") {
                    
                }
                Spacer()
                Button("Remove") {
                    
                }
                Spacer()
            }.padding()
        }
    }
}

#Preview {
    EditShapesView()
}
