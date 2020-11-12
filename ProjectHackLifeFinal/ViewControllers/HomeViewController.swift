//
//  HomeViewController.swift
//  HackLifeElementalAdd
//
//  Created by Abenayan Ketheeswaran on 12/4/19.
//  Copyright © 2019 THE WINDOW SPECIALISTS. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView:UITableView!
    var posts = [HackPost]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainTab = tabBarController as! MainTabController
        posts = mainTab.posts
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        
        let cellNib = UINib(nibName: "PostTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "postCell")
        
        
        view.addSubview(tableView)
        
    
        var layoutGuide:UILayoutGuide!
        
        
        if #available(iOS 11.0, *) {
            layoutGuide = view.safeAreaLayoutGuide
        } else {
            // Fallback on earlier versions
            layoutGuide = view.layoutMarginsGuide
        }
        
        
        tableView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: layoutGuide.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor).isActive = true
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        cell.set(post: posts[indexPath.row])
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let mainTab = tabBarController as! MainTabController
        posts = mainTab.posts
        print("Home")
        print(posts.count)
        view.willRemoveSubview(tableView)
        //tableView = UITableView(frame: view.bounds, style: .plain)
        let cellNib = UINib(nibName: "PostTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "postCell")
        view.addSubview(tableView)
        tableView.reloadData()
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
