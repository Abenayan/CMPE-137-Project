//
//  HackPost.swift
//  HackLifeElementalAdd
//
//  Created by Abenayan Ketheeswaran on 12/4/19.
//  Copyright © 2019 THE WINDOW SPECIALISTS. All rights reserved.
//

import Foundation


class HackPost{
    var id: Int
    var title: String
    var description: String
    var counter = 0
    init(id: Int, title: String, description: String){
        self.id = id
        self.title = title
        self.description = description
    }
    
    func createPost(t: String, d: String) -> HackPost{
        let newPost = HackPost(id: counter, title: t, description: d)
        counter += 1
        return newPost
    }
}
