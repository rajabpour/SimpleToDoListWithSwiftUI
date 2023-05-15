//
//  StatusView.swift
//  testTasks
//
//  Created by MR on 5/15/23.
//

import SwiftUI

struct StatusPickerView: View {
    
    @ObservedObject var vmTask : TaskViewModel

    @State private var selected: Bool = false
    let status: [Bool] = [false, true]
    
    var body: some View {
        Picker("", selection: $selected) {
            ForEach(status, id: \.self){
                Text($0 ? "Completed" : "ToDo")
                    .tag($0)
            }
        }
        .onChange(of: selected, perform: { value in
            vmTask.statusType = value
            vmTask.reload()
        })
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
}

struct StatusPickerView_Previews: PreviewProvider {
    static var previews: some View {
        StatusPickerView(vmTask: TaskViewModel())
    }
}
