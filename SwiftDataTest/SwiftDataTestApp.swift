//
//  SwiftDataTestApp.swift
//  SwiftDataTest
//
//  Created by Marcel Zimmermann on 25.01.24.
//

import SwiftUI

@main
struct SwiftDataTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Item.self)
        }
    }
}
