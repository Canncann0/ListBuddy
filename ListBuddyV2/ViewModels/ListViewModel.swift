//
//  ListViewModel.swift
//  ListBuddyV2
//
//  Created by Doğancan Turgut on 3.01.2024.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet{
            saveItem()
        }
    }
    
    
    let itemsKey: String = "items_list"
   
    init() {
        getItems()
    }
    
    func getItems (){
//        let newItems = [
//            ItemModel(title: "domates", isCompleted: false),
//            ItemModel(title: "Salatalık", isCompleted: true),
//            ItemModel(title: "Ekmek", isCompleted: false)
//        ]
//        items.append(contentsOf: newItems)
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        
        self.items = savedItems
    }
    
    func deleteItem (indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    
    func addItem(title:String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    
    func uptadeItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItem() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.setValue(encodedData, forKey: itemsKey)
        }
    }
    
    
    
}
