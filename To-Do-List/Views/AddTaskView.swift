//
//  AddTaskView.swift
//  To-Do-List
//
//  Created by Zoltan Vegh on 29/09/2025.
//

import SwiftUI

struct AddTaskView: View {
    @Binding var tasks: [ToDoTask]
    @State private var taskTitle: String = ""
    @State private var selectedPriority: TaskPriority = .normal
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    @State private var showAlert: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Task Title")
                .bold()
            
            TextField("Task Title", text: $taskTitle)
            
            Text("Priority")
                .bold()
            
            Picker("Priority", selection: $selectedPriority) {
                ForEach(TaskPriority.allCases, id: \.self) { priority in
                    Text(priority.title)
                }
            }
            
            Button {
                guard taskTitle.count >= 2 else {
                    alertTitle = "Invalid title"
                    alertMessage = "Title message should be 2 or more characters long"
                    showAlert = true
                    return
                }
                
                let task = ToDoTask(title: taskTitle, priority: selectedPriority)
                tasks.append(task)
                dismiss()
            } label: {
                Text("Add Task")
                    .foregroundStyle(.white)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(.green)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }

        }
        .padding()
        
        Spacer()
    }
}

#Preview {
    AddTaskView(tasks: .constant([]))
}
