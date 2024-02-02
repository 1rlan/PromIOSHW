//
//  complexInterfaceApp.swift
//  complexInterface
//
//  Created by Irlan Abushakhmanov on 02.02.2024.
//

import SwiftUI

@main
struct complexInterfaceApp: App {
    @State private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
