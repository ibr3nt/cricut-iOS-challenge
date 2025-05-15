//
//  ContentView.swift
//  ShapesRUS
//
//  Created by Brent Arnold on 5/13/25.
//

import SwiftUI
import SwiftData

struct ShapesGridView: View {
    
    @State private var shapesButtons: [ShapesButton] = []
    @EnvironmentObject private var navigationState: NavigationState
    @EnvironmentObject private var selectedShape: SelectedShape
    @EnvironmentObject private var savedShapesArray: SavedShapesArray
    // TODO: Started to work with SwiftData to persist the array of shapes but ran out of time.
    

    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            // TODO: This should be a reusable component rather than duplicating this across views.
            LazyVGrid(columns: columns) {
                ForEach(savedShapesArray.savedShapes, id: \.self) { savedShape in
                    Image(systemName: "\(savedShape.shapePath).fill")
                        .font(.system(size: 100))
                        .foregroundStyle(.teal)
                        .frame(width: 100, height: 100)
                }
            }
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
        .safeAreaInset(edge: .bottom) {
            HStack {
                ForEach(shapesButtons) { button in
                    Spacer()
                    Button(button.name) {
                        addShape(shape: button.drawPath)
                    }
                    Spacer()
                }
            }.padding()
        }
        .safeAreaInset(edge: .top) {
            HStack {
                Button("Clear All") {
                    clearAll()
                }
                Spacer()
                Button("Edit Circles") {
                    selectedShape.item = "circle"
                    print(selectedShape.item)
                    navigationState.routes.append(.editShapes)
                }
            }.padding()
            
        }
    }
    // TODO: these functions should also be extracted out of both views and
    func clearAll() {
        savedShapesArray.savedShapes.removeAll()
    }

    func addShape(shape: String) {
        savedShapesArray.savedShapes.append(SavedShape(shapePath: shape))
    }
}

#Preview {
    ShapesGridView()
    // Previews won't work with the way I've setup the navigation stack. Please use the simulator or run on device.
}
