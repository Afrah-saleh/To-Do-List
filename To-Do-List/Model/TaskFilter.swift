//
//  TaskFilter.swift
//  To-Do-List
//
//  Created by Afrah Saleh on 20/11/1445 AH.
//

import SwiftUI

enum TaskFilter: String
{
    static var allFilters: [TaskFilter]
    {
        return [.NonCompleted,.Completed,.OverDue,.All]
    }
    
    case All = "All"
    case NonCompleted = "To Do"
    case Completed = "Completed"
    case OverDue = "Overdue"
    
}
