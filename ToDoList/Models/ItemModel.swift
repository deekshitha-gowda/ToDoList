//
//  ItemModel.swift
//  ToDoList
//
//  Created by ATEU on 23/12/24.
//

import Foundation
//Immutable
struct ItemModel : Identifiable {
    let id : String
    let title : String
    let isCompleted : Bool
    
    init(id : String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    func updateCompletion() -> ItemModel{
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}

