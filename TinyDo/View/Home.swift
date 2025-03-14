//
//  Home.swift
//  TinyDo
//
//  Created by EveSquare on 2023/06/27.
//

import SwiftUI

struct Todo: Identifiable, Hashable {
    let id: UUID
    let name: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct Home: View {
    @State private var isKeyboardVisible = false
    
    @State var todos: [Todo] = [
        Todo(id: UUID(), name: "りんご買う"),
        Todo(id: UUID(), name: "ばなな買う"),
        Todo(id: UUID(), name: "おれんじ買う"),
        Todo(id: UUID(), name: "りんご買う"),
        Todo(id: UUID(), name: "ばなな買う"),
        Todo(id: UUID(), name: "おれんじ買う"),
        Todo(id: UUID(), name: "りんご買う"),
        Todo(id: UUID(), name: "ばなな買う"),
        Todo(id: UUID(), name: "おれんじ買う"),
        Todo(id: UUID(), name: "りんご買う"),
        Todo(id: UUID(), name: "ばなな買う"),
        Todo(id: UUID(), name: "おれんじ買う"),
        Todo(id: UUID(), name: "りんご買う"),
        Todo(id: UUID(), name: "ばなな買う"),
        Todo(id: UUID(), name: "おれんじ買う"),
        Todo(id: UUID(), name: "りんご買う"),
        Todo(id: UUID(), name: "ばなな買う"),
        Todo(id: UUID(), name: "おれんじ買う"),
    ]
    var body: some View {
        ZStack {
            VStack {
                List {
                    ForEach(todos, id: \.self) { todo in
                        Text(todo.name)
                    }
                    .onDelete{ indices in
                        todos.remove(atOffsets: indices)
                    }
                }
            }
            
            if isKeyboardVisible {
                withAnimation {
                    InputView(isKeyboardVisible: $isKeyboardVisible, todos: $todos)
                        .transition(.move(edge: .bottom))
                }
            }
            
            FloatingButton(tappedHanlder: self.showKeybord)
        }
    }
    
    func showKeybord() {
        isKeyboardVisible = true
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
