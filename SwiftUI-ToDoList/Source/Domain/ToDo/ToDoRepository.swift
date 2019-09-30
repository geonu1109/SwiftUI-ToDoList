//
//  ToDoRepository.swift
//  SwiftUI-ToDoList
//
//  Created by 전건우 on 2019/09/30.
//  Copyright © 2019 Geonu Jeon. All rights reserved.
//

import Foundation

fileprivate let TO_DO_KEY: String = "ToDos"

final class ToDoRepository {
    private let userDefaults: UserDefaults = .standard
    private let encoder: JSONEncoder = .init()
    private let decoder: JSONDecoder = .init()
    
    func save(toDoList: [ToDo]) throws {
        let dataList: [Data] = try toDoList.map(self.encoder.encode)
        self.userDefaults.set(dataList, forKey: TO_DO_KEY)
    }
    
    func load() throws -> [ToDo] {
        guard let dataList: [Data] = self.userDefaults.value(forKey: TO_DO_KEY) as? [Data] else {
            return []
        }
        return try dataList.map { try self.decoder.decode(ToDo.self, from: $0) }
    }
}
