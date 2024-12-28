//
//  listViewModel.swift
//  ToDoList
//
//  Created by ATEU on 23/12/24.
//

import Foundation

class ListViewModel : ObservableObject{
    @Published var items : [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey : String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard let data = UserDefaults.standard.data(forKey: itemsKey),
              let savedData = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        self.items = savedData
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
    func saveItems(){
       if let encodedData = try? JSONEncoder().encode(items){
           UserDefaults.standard.set(encodedData, forKey: itemsKey) // when we want to decode this data, we need to use forkey
        }
    }
}
