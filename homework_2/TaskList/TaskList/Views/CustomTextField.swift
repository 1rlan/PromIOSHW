//
//  CustomTextField.swift
//  TaskList
//
//  Created by Irlan Abushakhmanov on 02.02.2024.
//

import SwiftUI

struct CustomTextField: View {
    let placeholder: String
    @Binding var isCorrect: Bool
    @Binding var text: String

    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .background(isCorrect ? Color.gray.opacity(0.2) : .red.opacity(0.2))
            .cornerRadius(10)
            .onChange(of: text) { _, _ in
                isCorrect = true
            }
    }
}

#Preview {
    CustomTextField(placeholder: "Placeholder", isCorrect: .constant(true), text: .constant(.empty))
        .padding()
}
