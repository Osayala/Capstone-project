//
//  RestaurantApp.swift
//  Restaurant
//
//  Created by Oscar Suarez on 06/06/2024.
//

import SwiftUI

@main
struct RestaurantApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Onboarding().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
