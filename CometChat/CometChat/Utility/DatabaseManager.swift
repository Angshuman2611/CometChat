//
//  UserDefaultsExtensions.swift
//  CometChat
//
//  Created by Angshuman Das on 12/04/1401 AP.
//

import Foundation

enum UserDefaultKeys: String {
    case watchlistItem
    case token
    case userName
}

final class DatabaseManager {
    
   static let shared = DatabaseManager()
    
    func fetchWatchList() -> [Item] {
       
        let item = getItem()
        let dataJson = item.data(using: .utf8)!
        let itemData = try? JSONDecoder().decode(HomeFeedModel.self, from: dataJson)
        return (itemData?.items) ?? []
 
    }

    
    func addToWatchList(indexItem: Item) {
        
        let savedItem = getItem()

        if(savedItem.isEmpty) {
            
            let data = Item(id: indexItem.id, nodeID: indexItem.nodeID, name: indexItem.name, fullName: indexItem.fullName, itemPrivate: indexItem.itemPrivate, owner: indexItem.owner, htmlURL: indexItem.htmlURL, itemDescription: indexItem.itemDescription, fork: indexItem.fork, url: indexItem.url, forksURL: indexItem.forksURL)
            
            let jsonArray = ["items" : [data]]
            
            
            let str = String(data: try! JSONEncoder().encode(jsonArray), encoding: .utf8)
            print(str as Any)
            
            self.saveItem(data: (str!))
            
            
        }else {
            
            
            let dataJson = savedItem.data(using: .utf8)!

            var itemData = try! JSONDecoder().decode(HomeFeedModel.self, from: dataJson)
         
            itemData.items?.append(Item(id: indexItem.id, nodeID: indexItem.nodeID, name: indexItem.name, fullName: indexItem.fullName, itemPrivate: indexItem.itemPrivate, owner: indexItem.owner, htmlURL: indexItem.htmlURL, itemDescription: indexItem.itemDescription, fork: indexItem.fork, url: indexItem.url, forksURL: indexItem.forksURL))
            
            let str = String(data: try! JSONEncoder().encode(itemData), encoding: .utf8)
            print(str as Any)
            
            self.saveItem(data: (str!))
            
        }
        
    }
}

extension DatabaseManager {
    
    private func saveItem(data: String) {
        
        UserDefaults.standard.setValue(data, forKey: UserDefaultKeys.watchlistItem.rawValue)
       
    }
    
    func getItem() -> String {
        
        UserDefaults.standard.value(forKey: UserDefaultKeys.watchlistItem.rawValue) as? String ?? ""
       
    }
    
}
