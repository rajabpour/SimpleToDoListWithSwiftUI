//
//  DetailTaskView.swift
//  testTasks
//
//  Created by MR on 5/15/23.
//

import Foundation
import SwiftUI

struct DetailTaskView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var vmTask : TaskViewModel
    var task: TaskItem
    
    var body: some View {
        HStack(alignment: .top){
            VStack(alignment: .leading){
                Text("\(task.title!)")
                    .fontWeight(.bold)
                    .font(.title)
                Text("\(task.detail!)")
                    .font(.title3)
                Spacer()
            }
            Spacer()
        }.navigationBarTitle("Task", displayMode: .inline)
        .navigationBarItems(
            trailing: Button(action:{
                vmTask.toggleStatus(task)
                presentationMode.wrappedValue.dismiss()
            },
             label:{
                 Text(task.completed ? "Open" : "Done")
             })
        ).padding(20)
    }
}

struct DetailTaskView_Previews: PreviewProvider {
    static var previews: some View {
        DetailTaskView(vmTask: TaskViewModel(), task: TaskItem())
    }
}
