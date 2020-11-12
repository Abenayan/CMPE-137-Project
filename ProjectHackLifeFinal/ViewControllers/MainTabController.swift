//
//  MainTabController.swift
//  ProjectHackLifeFinal
//
//  Created by Abenayan Ketheeswaran on 12/10/19.
//  Copyright © 2019 THE WINDOW SPECIALISTS. All rights reserved.
//

import Foundation
import UIKit
import FirebaseFirestore
import Firebase

class MainTabController: UITabBarController{
    
    var posts = [
        HackPost(id: 1, title:  "Shawty", description: "Bigly!"),
        HackPost(id: 2, title: "Luke Skywalker", description: "I did not like the Last Jedi! Because I did not get to use my awesome Jedi powers!"),
        HackPost(id: 3, title: "Drizzy Drake", description: "Spittin that fire while a smoke by the fire")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    func loadToFireBase(){
        let db = Firestore.firestore()
        for hack in posts{
            db.collection("Hacks").addDocument(data: ["id": hack.id, "title":hack.title, "description":hack.description]){ (error) in
                if error != nil{
                   print("Error uploading Hacks")
                }
            }
        }
    }
    
    func loadDataFromFireBase(){
        let db = Firestore.firestore()
        var data: Any
        var temp = db.collection("Hacks").getDocuments { (snapshot, error) in
            if error != nil{
                print("Error")
            }
        }
    }
}
