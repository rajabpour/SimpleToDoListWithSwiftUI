//
//  AddTaskView.swift
//  testTasks
//
//  Created by MR on 5/15/23.
//

import Foundation
import SwiftUI

struct AddTaskView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var vmTask : TaskViewModel
    
    @State var title = ""
    @State var detail = ""
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Task")) {
                    TextField("Title ", text : $title)
                    TextField("Detail ", text : $detail)
                }
            }
            .navigationBarTitle("Add", displayMode: .inline)
            .navigationBarItems(
                leading: Button(action:{
                                presentationMode.wrappedValue.dismiss() },
                                label : {
                                    Text("Cancel")
                                    .foregroundColor(.red)
                                }),
                trailing: Button(action:{
                    vmTask.addTask(title: title, detail: detail)
                    presentationMode.wrappedValue.dismiss()
                },
                label:{
                    Text("Save")
                }).disabled(title.isEmpty || detail.isEmpty)
            )
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(vmTask: TaskViewModel())
    }
}
