//
//  TaskAction.swift
//  TaskList
//
//  Created by Irlan Abushakhmanov on 02.02.2024.
//

import Foundation

class TaskAction: ObservableObject {
    let state: TaskActionState
    @Published var model: TaskModel

    init(state: TaskActionState, model: TaskModel = .emptyModel) {
        self.state = state
        self.model = model
    }

    var isEditing: Bool {
        switch state {
        case .update: return true
        case .create: return false
        }
    }
}
