//
//  SplashScreen.swift
//  To-Do-List
//
//  Created by Afrah Saleh on 20/11/1445 AH.
//

import SwiftUI


struct SplashScreen: View {
    @State private var isActive: Bool = false
    let persistenceController = PersistenceController.shared

    var body: some View {
        if isActive {
            let context = persistenceController.container.viewContext
            let dateHolder = DateHolder(context)
            TaskListView()
                .environment(\.managedObjectContext, context)
                .environmentObject(dateHolder) // Ensure DateHolder is being passed here
        } else {
            VStack {
                Image("logo") // Replace "logo" with your image asset
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                Text("To Do List")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.dblue)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Delay of 2 seconds
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
