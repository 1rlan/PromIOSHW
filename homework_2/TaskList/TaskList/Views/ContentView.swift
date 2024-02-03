//
//  ContentView.swift
//  TaskList
//
//  Created by Irlan Abushakhmanov on 02.02.2024.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @Query(sort: \TaskModel.deadline) var models: [TaskModel]

    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(models, id: \.id) { model in
                    NavigationLink {
                        TaskActionView(taskAction: TaskAction(state: .update, model: model))
                    } label: {
                        TaskInfoCell(model: model)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding()

                    if model != models.last {
                        Divider()
                    }
                }
            }
            .navigationBarTitle("ToDo List", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(
                        destination: TaskActionView(taskAction: TaskAction(state: .create, model: .emptyModel))
                    ) {
                        Text("Add")
                            .font(.headline)
                    }
                }
            }
        }
    }
}


#Preview {
    MainView()
}
