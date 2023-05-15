//
//  TaskView.swift
//  testTasks
//
//  Created by MR on 5/15/23.
//

import SwiftUI

struct TaskView: View {
    
    var task : TaskItem
    
    var body: some View {
        VStack (alignment : .leading){
            HStack{
                VStack(alignment:.leading) {
                    Text("Name:")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(task.title!)
                        .font(.system(size: 20, weight: .bold))
                }
                Spacer()
                VStack (alignment:.leading){
                    Text("Created On:")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(task.createdOn! , style: .date)
                }
            }
        }
        .padding(10)
        .cornerRadius(10)
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(task: TaskItem())
    }
}
