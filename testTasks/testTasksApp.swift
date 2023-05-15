//
//  testTasksApp.swift
//  testTasks
//
//  Created by MR on 5/15/23.
//

import SwiftUI

@main
struct testTasksApp: App {
    let persistenceController = TaskPersistence.shared

    var body: some Scene {
        WindowGroup {
            ContentView(vmTask: TaskViewModel())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
