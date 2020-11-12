//
//  SignUpViewController.swift
//  ProjectHackLifeFinal
//
//  Created by Abenayan Ketheeswaran on 12/12/19.
//  Copyright © 2019 THE WINDOW SPECIALISTS. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var LastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements(){
        errorLabel.alpha = 0
        
    }
    
    func validateFields() -> String?{
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || LastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            return "Please fill in all the fields"
        }
        
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if isPasswordValid(cleanedPassword) == false{
            return "Please make a password with One Character, A number, And a special Character, and is 8 characters long"
        }
        
        return nil
    }
    
    func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        let error = validateFields()
        if error != nil{
            showError(error!)
        }
        else{
            let firstname = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastname = LastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                if err != nil{
                    //There was an error
                    //err?.localizedDescription
                    self.showError("Error creating user")
                }
                else{
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["firstname": firstname, "lastname":lastname, "uid":result!.user.uid]){ (error) in
                        
                        if error != nil{
                            self.showError("User did not store")
                        }
                    }
                    self.transitionToMainTab()
                    
                    
                }
                
            }
        }
    }
    
    
    func transitionToMainTab(){
        let mainTabController = storyboard?.instantiateViewController(withIdentifier: "MainTabController") as? MainTabController
        view.window?.rootViewController = mainTabController
        view.window?.makeKeyAndVisible()
        
        //present(mainTabController, animated: true, completion: nil)
    }
    
    func showError(_ message: String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    

}
