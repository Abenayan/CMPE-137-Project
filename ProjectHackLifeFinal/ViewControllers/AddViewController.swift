//
//  AddViewController.swift
//  ProjectHackLifeFinal
//
//  Created by Abenayan Ketheeswaran on 12/12/19.
//  Copyright © 2019 THE WINDOW SPECIALISTS. All rights reserved.
//

import Foundation
import UIKit
class AddViewController: UIViewController{
    var id = 0
    var posts = [HackPost]()
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    //let vc = MainTabControllr
    override func viewDidLoad() {
        super.viewDidLoad()
        let mainTab = tabBarController as! MainTabController
        posts = mainTab.posts
        setUpElements()
            
    }

    @IBAction func addButtonTapped(_ sender: Any) {
        let error = validateFields()
        if error != nil{
            showError(error!)
        }
        else{
            let title = titleTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let description = descriptionTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let newHack = HackPost(id: id, title: title, description: description)
            
            id += 1
            let mainTab = tabBarController as! MainTabController
            mainTab.posts.append(newHack)
            posts.append(newHack)
            print("Add")
            print(posts.count)
            print(mainTab.posts.count)
        }
        
    }
    

    
    func validateFields() -> String?{
        if titleTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || descriptionTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            return "Please fill in all the fields"
        }
     
        return nil
    }
    func setUpElements(){
        errorLabel.alpha = 0
    }
    
    func showError(_ message: String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
}
