//
//  ListView.swift
//  SwiftUI-ToDoList
//
//  Created by 전건우 on 2019/09/28.
//  Copyright © 2019 Geonu Jeon. All rights reserved.
//

import SwiftUI

struct ToDoListView: View {
    @State var toDoList: [ToDo]
    @State var isAdding: Bool = false
    
    var body: some View {
        NavigationView {
            List(self.toDoList) { (toDo) in
                ToDoItemView(model: toDo)
            }
            .navigationBarTitle("To Do List")
            .navigationBarItems(trailing: Button(action: { self.isAdding = true }) {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.accentColor)
            })
        }.sheet(isPresented: $isAdding) {
            MakeToDoView()
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(toDoList: mockList)
    }
}
