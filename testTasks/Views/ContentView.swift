//
//  ContentView.swift
//  testTasks
//
//  Created by MR on 5/15/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @ObservedObject var vmTask : TaskViewModel

    var body: some View {
        NavigationView{
            VStack{
                StatusPickerView(vmTask: vmTask)
                TaskListView(vmTask: vmTask)
            }
            .modifier(MainViewModifier(vmTask: vmTask))
        }
    }
    
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vmTask: TaskViewModel())
    }
}
