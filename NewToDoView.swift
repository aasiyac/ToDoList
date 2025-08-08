//
//  NewToDoView.swift
//  ToDoList
//
//  Created by Scholar on 8/8/25.
//

import SwiftUI
import SwiftData

struct NewToDoView: View {
    var body: some View {
        VStack {
            Text("Task title")
            TextField("Enter the task description...", text: $toDoItem.title, axis: .vertical)
            Toggle(isOn: $toDoItem.isImportant) {
                Text("Is it important?")
            }
            Button {
                
            } label: {
                Button {
                    addToDo()
                } label: {
                    Text("Save")
                }
            }
        }
        .padding()
    }
    @Bindable var toDoItem: ToDoItem
    @Environment(\.modelContext) var modelContext
    
    func addToDo() {
        let toDo = ToDoItem(title: toDoItem.title, isImportant: toDoItem.isImportant)
        modelContext.insert(toDo)
    }
}

#Preview {
    NewToDoView(toDoItem: ToDoItem(title: "", isImportant: false))
}
