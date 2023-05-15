//
//  TaskListView.swift
//  testTasks
//
//  Created by MR on 5/15/23.
//

import SwiftUI

struct TaskListView: View {
    
    @ObservedObject var vmTask : TaskViewModel

    var body: some View {
        List {
            ForEach (vmTask.tasks){ task in
                NavigationLink(destination: DetailTaskView(vmTask: vmTask, task: task)) {
                    TaskView(task: task)
                }
            }
            .onDelete(perform: remove)
            .onMove(perform: move)
        }.listStyle(InsetListStyle())
    }
    
    func remove(from source: IndexSet) {
        guard let index = source.first else { return }
        vmTask.removeTask(at: index)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        vmTask.tasks.move(fromOffsets: source, toOffset: destination)
        vmTask.resetOrder()
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView(vmTask: TaskViewModel())
    }
}

