//
//  CreatingTaskView.swift
//  TaskList
//
//  Created by Irlan Abushakhmanov on 02.02.2024.
//

import SwiftUI

struct TaskActionView: View {
    @ObservedObject var taskAction: TaskAction
    @ObservedObject var fieldModel = FieldModel()
    @Environment(\.modelContext) var modelContext
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            CustomTextField(placeholder: "Task Name", isCorrect: $fieldModel.isCorrect, text: $fieldModel.title)
            CustomTextEditor(placeholder: "Description (optional)", text: $fieldModel.description)
            CustomDatePicker(title: "Select date", selectedDate: $fieldModel.deadline)

            Spacer()

            Button {
                handleButtonTap()
            } label: {
                Text(taskAction.state.buttonTitle)
                    .font(.system(.title2, design: .rounded))
                    .frame(maxWidth: .infinity, maxHeight: 40)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .navigationTitle(taskAction.state.title)
        .navigationBarTitleDisplayMode(.inline)
        .if(taskAction.isEditing) { view in
            view.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        deleteModel()
                    } label: {
                        Image(systemName: "trash")
                            .font(.headline)
                    }
                }
            }
        }.onAppear {
            fieldModel.setupFields(model: taskAction.model)
        }.onDisappear {
            fieldModel.clearFields()
        }
    }

    private func handleButtonTap() {
        guard fieldModel.isFilled else {
            fieldModel.isCorrect = false
            return
        }

        switch taskAction.state {
        case .update:
            updateModel()
        case .create:
            insertModel()
        }
    }

    private func insertModel() {
        modelContext.insert(fieldModel.createModel())
        pop()
    }

    private func updateModel() {
        taskAction.model.updateValues(model: fieldModel.createModel())
        pop()
    }

    private func deleteModel() {
        modelContext.delete(taskAction.model)
        pop()
    }

    private func pop() {
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    TaskActionView(
        taskAction: TaskAction(
            state: .create,
            model: TaskModel(
                title: "Title",
                fullDescription: "Description",
                deadline: .now
            )
        )
    )
}

