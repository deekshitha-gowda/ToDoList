//
//  listViewModel.swift
//  ToDoList
//
//  Created by ATEU on 23/12/24.
//

import Foundation

class ListViewModel : ObservableObject{
    @Published var items : [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "This is the first Item ", isCompleted: false), ItemModel(title: "second Item ", isCompleted: true ), ItemModel(title: "third Item ", isCompleted: false)
        ]
        items.append(contentsOf: newItems)
    }

    func deleteItem(indexSet : IndexSet){
        items.remove(atOffsets: indexSet )
    }
    func moveItem (from : IndexSet, to : Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem (title : String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item1 : ItemModel){
        if let index = items.firstIndex(where: {$0.id == item1.id}){
            items[index] = item1.updateCompletion()
        }
        
    }
}
