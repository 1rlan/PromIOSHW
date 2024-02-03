//
//  TaskListApp.swift
//  TaskList
//
//  Created by Irlan Abushakhmanov on 02.02.2024.
//

import SwiftUI
import SwiftData

@main
struct TaskListApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: [TaskModel.self])
    }
}
