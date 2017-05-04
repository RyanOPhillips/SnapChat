//
//  SelectUserViewController.swift
//  SnapChat
//
//  Created by Ryan Phillips on 5/3/17.
//  Copyright © 2017 Ryan Phillips. All rights reserved.
//

import UIKit
import Firebase

class SelectUserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var users : [User] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        FIRDatabase.database().reference().child("users").observe(FIRDataEventType.childAdded, with: {(snapshot) in
            
            
            let user = User()
            user.email = snapshot.value!["email"] as! String
            user.uid = snapshot.key
        
            self.users.append(user)
            
            self.tableView.reloadData()
        })

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let user = users[indexPath.row]
        
        cell.textLabel?.text = user.email
        
        return cell
    }

}
