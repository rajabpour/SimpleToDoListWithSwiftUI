//
//  Persistence.swift
//  testTasks
//
//  Created by MR on 5/15/23.
//

import CoreData

struct TaskPersistence {
    static let shared = TaskPersistence()

    let container: NSPersistentContainer
    init(){
        container = NSPersistentContainer(name: "testTasks")

        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                print("Unresolved error \(error)")
            }
        }
    }
    
    func fetchAll(isCompleted: Bool = false) -> [TaskItem] {
        let rq = TaskItem.fetchRequest()
        rq.predicate = NSPredicate(format: "completed == %d", isCompleted)
        rq.sortDescriptors = [
            NSSortDescriptor(keyPath: \TaskItem.order, ascending: true),
            NSSortDescriptor(keyPath: \TaskItem.createdOn, ascending: false)
        ]
        
        do{
            let list = try container.viewContext.fetch(rq)
            return list
        }catch ( let error){
            print(error)
            return []
        }
    }
    
    func remove(_ item: TaskItem) {
        container.viewContext.delete(item)
        save()
    }
    func insert(_ item: TaskItem) {
        container.viewContext.insert(item)
        save()
    }
    
    func save() {
        do{
            try container.viewContext.save()
        }catch{
            print(error)
        }
    }
    
    func newItem() -> TaskItem {
        let managedContext = self.container.viewContext
        let item = TaskItem(context: managedContext)
        return item
    }
}
