//
//  FieldModel.swift
//  TaskList
//
//  Created by Irlan Abushakhmanov on 03.02.2024.
//

import Foundation

final class FieldModel: ObservableObject {
    @Published var title: String = .empty
    @Published var description: String = .empty
    @Published var deadline: Date = .now
    @Published var isCorrect = true

    var isFilled: Bool {
        !title.isEmpty
    }

    func setupFields(model: TaskModel) {
        title = model.title
        description = model.fullDescription
        deadline = model.deadline
    }

    func createModel() -> TaskModel {
        TaskModel(title: title, fullDescription: description, deadline: deadline)
    }

    func clearFields() {
        title = .empty
        description = .empty
        deadline = .now
    }
}
