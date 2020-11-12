//
//  ViewController.swift
//  ProjectHackLifeFinal
//
//  Created by Abenayan Ketheeswaran on 12/10/19.
//  Copyright © 2019 THE WINDOW SPECIALISTS. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseUI
import Firebase
import FirebaseFirestore
class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements(){
        errorLabel.alpha = 0
    }

    @IBAction func loginTapped(_ sender: Any) {
        //let mainTabController = storyboard?.instantiateViewController(withIdentifier: "MainTabController") as! MainTabController
        
        //present(mainTabController, animated: true, completion: nil)
        
        /*let authUI = FUIAuth.defaultAuthUI()
        guard authUI != nil else{
            return
        }
        authUI?.delegate = self
        let authViewController = authUI!.authViewController()
        present(authViewController, animated: true, completion: nil)*/
        let error = validateFields()
        if error != nil{
            showError(error!)
        }else{
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if error != nil{
                    //There was an error
                    //err?.localizedDescription
                    self.showError("Error loggin in. Try again with different email or password")
                }
                else{
                    self.transitionToMainTab()
                }
            }
        }
    }
    
    func validateFields() -> String?{
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            return "Please fill in all the fields"
        }
        return nil
    }
    
    func transitionToMainTab(){
        let mainTabController = self.storyboard?.instantiateViewController(withIdentifier: "MainTabController") as? MainTabController
        self.view.window?.rootViewController = mainTabController
        self.view.window?.makeKeyAndVisible()
        
        //present(mainTabController, animated: true, completion: nil)
    }
    
    func showError(_ message: String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
}


/*extension LoginViewController: FUIAuthDelegate{
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {        
        if error != nil{
            return
        }
        
        let mainTabController = storyboard?.instantiateViewController(withIdentifier: "MainTabController") as! MainTabController
        present(mainTabController, animated: true, completion: nil)
        
        
        
    }
}*/

