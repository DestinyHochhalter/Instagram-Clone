//
//  FeedVC+Feed.swift
//  insta
//
//  Created by Destiny Hochhalter on 2/15/19.
//  Copyright © 2019 Destiny Hochhalter. All rights reserved.
//

import UIKit

extension FeedVC: UITableViewDelegate, UITableViewDataSource, PostCellDelegate {
    func delegateUserTapped(cell: PostCell) {
        
        if let indexPath = feedTable.indexPath(for: cell) {
            // get user by id from the post info
            let userId = Data.posts[indexPath.row].userID
            if let user = getUser(id: userId) {
                userToPass = user
                self.performSegue(withIdentifier: Constants.Segue.user, sender: nil)
            }
        }
    }
    
    
    func delegateCheeseTapped(cell: PostCell) {
        // get indexpath of cell interaction to get the post  -> posts[indexPath.row]
        if let indexPath = feedTable.indexPath(for: cell) {
            // update likes in model
            Data.posts[indexPath.row].likes += 1
            // update cell label to show new like count
            cell.likesLbl.text = "\(Data.posts[indexPath.row].likes) likes"
            // reload a cell
            //feedTable.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    func setupTable() {
        feedTable.delegate = self
        feedTable.dataSource = self
        feedTable.allowsSelection = false
    }
    
    // Table view methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let postCell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        let post = Data.posts[indexPath.row]
        postCell.delegate = self
        postCell.setup(model: post)
        return postCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // automatically sizes cells dynamically based on autolayout height
        // everything has a fixed height except the caption which has 0 lines and can grow vertically
        // if you have more than one view or label that can expand vertically, set the content hugging or
        // resistance priority in the ruler inspector to something higher or lower
        return UITableView.automaticDimension
    }
    
}
