//
//  CheckBoxView.swift
//  To-Do-List
//
//  Created by Afrah Saleh on 18/11/1445 AH.
//

import SwiftUI

struct CheckBoxView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @EnvironmentObject var dateHolder: DateHolder
    @ObservedObject var passedTaskItem: TaskItem
    var body: some View {
        
        
        Image(systemName: passedTaskItem.isCompleted() ? "checkmark.circle.fill" : "circle")
            .foregroundColor(passedTaskItem.isCompleted() ? .green: .secondary)
            .onTapGesture {
                withAnimation{
                    if !passedTaskItem.isCompleted()
                    {
                        passedTaskItem.completedDate = Date()
                        dateHolder.saveContext(viewContext)
                    }
                }
            }
    }
}

#Preview {
    CheckBoxView(passedTaskItem: TaskItem())
}
