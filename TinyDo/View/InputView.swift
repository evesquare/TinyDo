//
//  InputView.swift
//  TinyDo
//
//  Created by EveSquare on 2023/06/28.
//

import SwiftUI

struct InputView: View {
    @Binding var isKeyboardVisible: Bool
    @Binding var todos: [Todo]
    @State private var newTodo: String = ""
    @State private var isEditing: Bool  = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.white
                .ignoresSafeArea(.all)
            
            VStack {
                TextField("Todoを入力", text: $newTodo, onCommit: {
                    guard !newTodo.isEmpty else {
                        isKeyboardVisible = false
                        return
                    }
                    let todo = Todo(id: UUID(), name: newTodo)
                    todos.append(todo)
                    newTodo = ""
                    isKeyboardVisible = false
                })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color.white)
                    .onAppear {
                        isEditing = true
                    }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}
