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
        
        // Filter array for selectedShape.item
        let filteredShapes = savedShapesArray.savedShapes.filter { $0.shapePath == selectedShape.item }
        
        ScrollView {
            LazyVGrid(columns: columns) {
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
                    deleteAllSelectedShapes(filtered: filteredShapes)
                }
                Spacer()
                Button("Add") {
                    addSelectedShape()
                }
                Spacer()
                Button("Remove") {
                    removeSelectedShape()
                }
                Spacer()
            }.padding()
        }
    }
    
    func deleteAllSelectedShapes(filtered: [SavedShape]) {
        savedShapesArray.savedShapes = savedShapesArray.savedShapes.filter { !filtered.contains($0)}
    }
    
    func addSelectedShape() {
        savedShapesArray.savedShapes.append(SavedShape(shapePath: selectedShape.item))
    }
    
    func removeSelectedShape() {
        for (index, item) in savedShapesArray.savedShapes.enumerated().reversed() {
            if item.shapePath == selectedShape.item {
                savedShapesArray.savedShapes.remove(at: index)
                break
            }
        }
    }
}

#Preview {
    EditShapesView()
}
