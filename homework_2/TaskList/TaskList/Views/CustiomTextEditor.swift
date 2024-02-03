//
//  CustiomTextEditor.swift
//  TaskList
//
//  Created by Irlan Abushakhmanov on 02.02.2024.
//

import SwiftUI

struct CustomTextEditor: View {
    let placeholder: String
    @Binding var text: String

    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundStyle(.gray.opacity(0.65))
                    .padding(.leading, 16)
                    .padding(.top, 18)
            }

            TextEditor(text: $text)
                .scrollContentBackground(.hidden)
                .padding(.leading, 12)
                .padding(.top, 10)
                .background(.gray.opacity(0.2))
                .cornerRadius(10)
                .frame(maxHeight: 200)
        }
    }
}

#Preview {
    CustomTextEditor(placeholder: "Placeholder", text: .constant(.empty))
}
