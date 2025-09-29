//
//  TaskView.swift
//  To-Do-List
//
//  Created by Zoltan Vegh on 29/09/2025.
//

import SwiftUI

struct TaskView: View {
    var task: ToDoTask
    
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle" : "circle")
            
            Text(task.title)
                .font(.headline)
            
            Spacer()
            
            if task.priority == .urgent {
                Text(task.priority.title)
                    .foregroundStyle(.red)
                    .frame(width: 100)
                    .frame(height: 30)
                    .background(.lightRed)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } else if task.priority == .normal {
                Text(task.priority.title)
                    .foregroundStyle(.blue)
                    .frame(width: 100)
                    .frame(height: 30)
                    .background(.lightBlue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } else if task.priority == .optional {
                Text(task.priority.title)
                    .foregroundStyle(.green)
                    .frame(width: 100)
                    .frame(height: 30)
                    .background(.lightGreen)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    TaskView(task: ToDoTask(title: "Test Title", priority: .optional))
}
