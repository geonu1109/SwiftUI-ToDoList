//
//  ContentView.swift
//  SwiftUI-ToDoList
//
//  Created by 전건우 on 2019/09/29.
//  Copyright © 2019 Geonu Jeon. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isChecked: Bool = false
    
    var body: some View {
        ToDoListView(toDoList: mockList)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
