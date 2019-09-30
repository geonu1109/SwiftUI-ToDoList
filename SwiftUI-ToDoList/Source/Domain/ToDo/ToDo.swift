//
//  ToDo.swift
//  SwiftUI-ToDoList
//
//  Created by 전건우 on 2019/09/28.
//  Copyright © 2019 Geonu Jeon. All rights reserved.
//

import Foundation

let mockList: [ToDo] = [
    {
        var toDo: ToDo = .init()
        toDo.title = "할일1"
        return toDo
    }(),
    {
        var toDo: ToDo = .init()
        toDo.title = "할일2"
        return toDo
    }()
]

final class ToDo: Identifiable, Codable, Equatable, CustomStringConvertible {
    let id: UUID = .init()
    var title: String = .init()
    var date: Date = .init()
    var isMarked: Bool = false
    var isCompleted: Bool = false
    
    var description: String {
        "title: \(title), isMarked: \(isMarked), isCompleted: \(isCompleted)"
    }
    
    static func == (lhs: ToDo, rhs: ToDo) -> Bool {
        return lhs.id == rhs.id
    }
}
