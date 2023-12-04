//
//  LeaderBoardTableViewManager.swift
//  stroll
//
//  Created by Gigi Gillen on 12/1/23.
//

import Foundation
import UIKit




extension HomepageViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return completedUsers.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "names", for: indexPath) as! LeaderBoardViewCell
        cell.selectionStyle = .none
        return cell
    }
    
    //MARK: when cell is pressed...
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
