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
    
    var body: some View {
        NavigationView {
            List(self.toDoList) { (toDo) in
                ToDoItemView(model: toDo)
            }
            .navigationBarTitle("할 일 목록")
            .navigationBarItems(trailing: Button(action: {}) {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.accentColor)
            })
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(toDoList: mockList)
    }
}
