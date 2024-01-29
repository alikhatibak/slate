//
//  Slate_AppApp.swift
//  Slate App
//
//  Created by Ali Khatib on 1/28/24.
//

import SwiftUI
import SwiftData

@main
struct Slate_AppApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Slate.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
