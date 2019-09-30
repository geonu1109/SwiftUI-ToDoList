//
//  ToDoItemView.swift
//  SwiftUI-ToDoList
//
//  Created by 전건우 on 2019/09/28.
//  Copyright © 2019 Geonu Jeon. All rights reserved.
//

import SwiftUI
import Combine

struct ToDoItemView: View {
    private let toDo: ToDo
    
    @State var isMarked: Bool {
        willSet {
            self.toDo.isMarked = newValue
        }
    }
    
    @State var isCompleted: Bool {
        willSet {
            self.toDo.isCompleted = newValue
        }
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Image(systemName: self.isMarked ? "star.fill" : "star")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(self.isMarked ? .yellow : .gray)
                .onTapGesture { self.isMarked.toggle() }
            VStack(alignment: .leading, spacing: 3.0) {
                Text(toDo.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .strikethrough(isCompleted, color: .primary)
                    .lineLimit(1)
                Text(toDo.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .strikethrough(isCompleted, color: .secondary)
                    .lineLimit(1)
            }.onTapGesture {
                self.isCompleted.toggle()
            }
        }
    }
    
    init(model: ToDo) {
        self.toDo = model
        self._isMarked = .init(wrappedValue: model.isMarked)
        self._isCompleted = .init(wrappedValue: model.isCompleted)
    }
    
    private func toggleCompleted() {
        let newState: Bool = !self.toDo.isCompleted
        self.toDo.isCompleted = newState
        self.isCompleted = newState
    }
}

struct ToDoCellView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(mockList) { (mock) in
            ToDoItemView(model: mock)
                .previewLayout(.fixed(width: 300, height: 60))
        }
    }
}
