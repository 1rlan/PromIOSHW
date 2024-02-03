//
//  TaskModel.swift
//  TaskList
//
//  Created by Irlan Abushakhmanov on 02.02.2024.
//

import Foundation
import SwiftData

@Model
final class TaskModel {
    var title: String
    var fullDescription: String
    var deadline: Date

    static let emptyModel = TaskModel(title: .empty, fullDescription: .empty, deadline: .now)

    init(title: String, fullDescription: String, deadline: Date) {
        self.title = title
        self.fullDescription = fullDescription
        self.deadline = deadline
    }

    func updateValues(model: TaskModel) {
        self.title = model.title
        self.fullDescription = model.fullDescription
        self.deadline = model.deadline
    }

    private static let formatter = DateService()
    var deadlineFormat: String {
        TaskModel.formatter.format(date: deadline)
    }

    var happened: Bool {
        TaskModel.formatter.isToday(date: deadline)
    }
}
