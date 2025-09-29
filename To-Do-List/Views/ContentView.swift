//
//  ContentView.swift
//  To-Do-List
//
//  Created by Zoltan Vegh on 29/09/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var tasks: [ToDoTask] = [
        ToDoTask(title: "Buy Groceries", priority: .normal),
        ToDoTask(title: "Workout", priority: .optional)
    ]
    @State private var showAddTaskView: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach($tasks) { $task in
                        Button {
                            task.isCompleted.toggle()
                        } label: {
                            TaskView(task: task)
                        }
                        .buttonStyle(.plain)
                    }
                    .onDelete(perform: delete)
                }
                .scrollContentBackground(.hidden)
            }
            .navigationDestination(isPresented: $showAddTaskView, destination: {
                AddTaskView(tasks: $tasks)
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddTaskView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
             .navigationTitle("Tasks")
        }
        .padding()
    }
    
    private func delete(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
