//
//  TaskActionState.swift
//  TaskList
//
//  Created by Irlan Abushakhmanov on 02.02.2024.
//

import Foundation

enum TaskActionState {
    case update
    case create

    var title: String {
        switch self {
        case .create: return "Create task"
        case .update: return "Update task"
        }
    }

    var buttonTitle: String {
        switch self {
        case .create: return "Create"
        case .update: return "Update"
        }
    }
}
