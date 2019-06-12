//
//  ViewController.swift
//  insta
//
//  Created by Destiny Hochhalter on 2/15/19.
//  Copyright © 2019 Destiny Hochhalter. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {
    
    var userToPass: User?
    // Outlets
    @IBOutlet weak var feedTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.Segue.user {
            if let vc = segue.destination as? UserVC {
                vc.passedUser = userToPass
            }
        }
    }
}

