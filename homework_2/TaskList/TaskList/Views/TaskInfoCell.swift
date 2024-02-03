//
//  TaskInfoCell.swift
//  TaskList
//
//  Created by Irlan Abushakhmanov on 02.02.2024.
//

import SwiftUI

struct TaskInfoCell: View {
    let model: TaskModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(model.title)
                    .font(.system(.title, design: .rounded))
                Spacer()
                Text(model.deadlineFormat)
                    .font(.system(.headline, design: .rounded))
                    .foregroundStyle(model.happened ? .red : .black)
            }

            Text(model.fullDescription)
                .font(.system(.callout, design: .rounded))
        }
        .contentShape(Rectangle())
    }
}

#Preview {
    let model = TaskModel(title: "Clean dishes", fullDescription: "Do it right now", deadline: .now)
    return TaskInfoCell(model: model).padding()
}
