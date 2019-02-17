//
//  Offer.swift
//  MVVMDEMO
//
//  Created by Adel on 1/30/19.
//  Copyright © 2019 Adel. All rights reserved.
//

import Foundation

class Item{
    var userId :Int
    var id :Int
    var title :String
    var completed :Bool
    
    
    init(userId: Int, id: Int, title: String, completed: Bool) {
            self.userId = userId
            self.id = id
            self.title = title
            self.completed = completed
        
        }
    convenience init(with json: [String: Any]) {
        let userId = json["userId"] as? Int ?? 555
        let id = json["id"] as? Int ?? 555
        let title = json["title"] as? String ?? "default title"
        let completed = json["completed"] as? Bool ?? true
        
        self.init(userId: userId, id: id, title: title, completed: completed)
    }
    
}
