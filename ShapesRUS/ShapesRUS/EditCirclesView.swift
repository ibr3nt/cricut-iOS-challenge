//
//  EditCirclesView.swift
//  ShapesRUS
//
//  Created by Brent Arnold on 5/14/25.
//

import SwiftUI

struct EditCirclesView: View {
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
//                ForEach(savedShapes, id: \.self) { savedShape in
//                    Image(systemName: "\(savedShape.shapePath).fill")
//                        .font(.system(size: 100))
//                        .foregroundStyle(.teal)
//                        .frame(width: 100, height: 100)
//                }
            }
        }
        .safeAreaInset(edge: .bottom) {
            HStack {
//                ForEach(shapesButtons) { button in
                    Spacer()
                    
                Button("Delete All") {
//                        addShape(shape: button.drawPath)
                    }
                    Spacer()
                Button("Add") {
                    
                }
                    Spacer()
                Button("Remove") {
                    
                }
                Spacer()
//                }
            }.padding()
        }
    }
}

#Preview {
    EditCirclesView()
}
