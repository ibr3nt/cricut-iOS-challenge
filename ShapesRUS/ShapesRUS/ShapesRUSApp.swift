//
//  ShapesRUSApp.swift
//  ShapesRUS
//
//  Created by Brent Arnold on 5/13/25.
//

import SwiftUI

enum Route: Hashable {
    case editShapes
    // potential for additional navigation views here
}

class NavigationState: ObservableObject {
    @Published var routes: [Route] = []
}

@main
struct ShapesRUSApp: App {
    
    @StateObject private var navigationState = NavigationState()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationState.routes) {
                ShapesGridView()
                    .environmentObject(navigationState)
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .editShapes:
                            EditShapesView()
                        }
                    }
            }
        }
    }
}
