//
//  HomeViewController.swift
//  instagram-clone
//
//  Created by Rodrigo Bell on 3/5/17.
//  Copyright © 2017 Rodrigo Bell. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "home-cell", for: indexPath)
        
        return cell
    }
    
    @IBAction func onLogout(_ sender: Any) {
        print("Logging out current user")
        PFUser.logOutInBackground { (error: Error?) in
            if error != nil {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }

}
