//
//  ToDoTaskModel.swift
//  To-Do-List
//
//  Created by Zoltan Vegh on 29/09/2025.
//

import Foundation

struct ToDoTask: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let priority: TaskPriority
    var isCompleted: Bool = false
}
