//
//  TaskTypeModel.swift
//  To-Do-List
//
//  Created by Zoltan Vegh on 29/09/2025.
//

import Foundation

enum TaskPriority: String, CaseIterable, Identifiable {
    case optional, normal, urgent
    var id: Self { self }
    
    var title: String {
        switch self {
        case .optional:
            return "Optional"
        case .normal:
            return "Normal"
        case .urgent:
            return "Urgent"
        }
    }
}
