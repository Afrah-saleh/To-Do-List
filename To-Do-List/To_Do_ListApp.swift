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
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
