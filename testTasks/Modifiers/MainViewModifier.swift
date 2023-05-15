//
//  MainViewModifier.swift
//  testTasks
//
//  Created by MR on 5/15/23.
//

import Foundation
import SwiftUI

struct MainViewModifier : ViewModifier {
    
    @ObservedObject var vmTask : TaskViewModel

    func body(content : Content) -> some View {
        
        content
            .navigationBarTitle("Tasks")
            .navigationBarItems(trailing: HStack(spacing:30){
                EditButton()
                    .disabled(vmTask.tasks.isEmpty)
                Button(
                    action : {
                        vmTask.isPresented.toggle()
                    },
                    label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    })
            })
            .onChange(of: vmTask.statusType, perform: { _ in
                guard !vmTask.tasks.isEmpty else { return }
                withAnimation() {vmTask.reload()}
            })
            .fullScreenCover(isPresented: $vmTask.isPresented, content: {
                AddTaskView(vmTask: vmTask)
            })
    }
    
}
