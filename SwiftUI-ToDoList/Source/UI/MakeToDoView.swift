//
//  MakeToDoView.swift
//  SwiftUI-ToDoList
//
//  Created by 전건우 on 2019/10/01.
//  Copyright © 2019 Geonu Jeon. All rights reserved.
//

import SwiftUI

struct MakeToDoView: View {
    @State var title: String = ""
    @State var subtitle: String = ""
    
    var body: some View {
        NavigationView {
            List {
                TextField("Title", text: $title)
                TextField("Subtitle", text: $subtitle)
            }
            .navigationBarTitle("Make New To Do")
        }
    }
}

struct MakeToDoView_Previews: PreviewProvider {
    static var previews: some View {
        MakeToDoView()
    }
}
