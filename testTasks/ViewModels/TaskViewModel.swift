//
//  TaskViewModel.swift
//  testTasks
//
//  Created by MR on 5/15/23.
//

import Foundation

class TaskViewModel : Identifiable , ObservableObject {
    
    @Published var tasks : [TaskItem]

    @Published var statusType : Bool = false
    @Published var isPresented = false

    init() {
        tasks = TaskPersistence.shared.fetchAll()
    }
    
    func addTask(title: String, detail: String){
        let task = TaskPersistence.shared.newItem()
        task.title = title
        task.detail = detail
        task.completed = false
        task.createdOn = Date()

        TaskPersistence.shared.insert(task)
        tasks.append(task)
    }
    
    func removeTask(at index: Int){
        let task = tasks[index]
        TaskPersistence.shared.remove(task)
        tasks.remove(at: index)
    }
 
    func reload() {
        tasks = TaskPersistence.shared.fetchAll(isCompleted: statusType)
    }
    
    func toggleStatus(_ task: TaskItem) {
        task.completed = !task.completed
        TaskPersistence.shared.save()
        reload()
    }
    
    func resetOrder() {
        var i: Int32 = 0
        for item in tasks {
            item.order = i
            i += 1
        }
        TaskPersistence.shared.save()
        reload()
    }
}

