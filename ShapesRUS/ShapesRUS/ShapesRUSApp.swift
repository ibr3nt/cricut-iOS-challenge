//
//  ShapesRUSApp.swift
//  ShapesRUS
//
//  Created by Brent Arnold on 5/13/25.
//

import SwiftUI

enum Route: Hashable {
    case editShapes
    // potential for adding more navigation routes here
}

class NavigationState: ObservableObject {
    @Published var routes: [Route] = []
}

class SelectedShape: ObservableObject {
    @Published var item: String = ""
}

class SavedShapesArray: ObservableObject {
    @Published var savedShapes: [SavedShape] = []
}

@main
struct ShapesRUSApp: App {
    
    @StateObject private var navigationState = NavigationState()
    @StateObject private var selectedShape = SelectedShape()
    @StateObject private var savedShapesArray = SavedShapesArray()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationState.routes) {
                ShapesGridView()
                    .environmentObject(navigationState)
                    .environmentObject(selectedShape)
                    .environmentObject(savedShapesArray)
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .editShapes:
                            EditShapesView()
                                .environmentObject(selectedShape)
                                .environmentObject(savedShapesArray)
                                
                        }
                    }
                    
                    
            }
        }
    }
}
