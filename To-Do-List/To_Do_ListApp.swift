//
//  To_Do_ListApp.swift
//  To-Do-List
//
//  Created by Afrah Saleh on 18/11/1445 AH.
//

import SwiftUI

@main
struct To_Do_ListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            let context = persistenceController.container.viewContext
            let dateHolder = DateHolder(context)
            TaskListView()
                .environment(\.managedObjectContext, context)
                .environmentObject(dateHolder) // Ensure DateHolder is being passed here
        }
    }
}
