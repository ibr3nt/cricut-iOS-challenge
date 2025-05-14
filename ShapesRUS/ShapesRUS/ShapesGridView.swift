//
//  ContentView.swift
//  ShapesRUS
//
//  Created by Brent Arnold on 5/13/25.
//

import SwiftUI



struct ShapesGridView: View {
    
    @State private var shapesButtons: [ShapesButton] = []
    @State private var savedShapes: [SavedShape] = []

    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(savedShapes, id: \.self) { savedShape in
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
                    editCircles()
                }
            }.padding()
            
        }
    }
    
    func clearAll() {
        savedShapes.removeAll()
    }

    func editCircles() {
        
    }

    func addShape(shape: String) {
        savedShapes.append(SavedShape(shapePath: shape))
    }
}



#Preview {
    ShapesGridView()
}
