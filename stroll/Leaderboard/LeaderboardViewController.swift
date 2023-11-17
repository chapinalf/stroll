//
//  LeaderboardViewController.swift
//  stroll
//
//  Created by Chapin Alf on 10/30/23.
//

import UIKit

class LeaderboardViewController: UIViewController {

    let leaderboardView = LeaderboardView()
    
    var leaderBoard = [Leader]()
    
    //MARK: load the view...
    override func loadView() {
        view = leaderboardView
    }

    //MARK: do on load...
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Leaderboard"
        
        leaderBoard.append(Leader(name: "Zaneer Mitha", strolls: 50, streak: 43))
        leaderBoard.append(Leader(name: "Chapin Alf", strolls: 45, streak: 41))
        leaderBoard.append(Leader(name: "Gigi Gillen", strolls: 39, streak: 36))
        leaderBoard.append(Leader(name: "Sally", strolls: 34, streak: 31))
        leaderBoard.append(Leader(name: "Sara", strolls: 33, streak: 30))
        leaderBoard.append(Leader(name: "Jeff", strolls: 32, streak: 29))
        leaderBoard.append(Leader(name: "George", strolls: 31, streak: 28))
        
        leaderboardView.tableViewLeaderboard.delegate = self
        leaderboardView.tableViewLeaderboard.dataSource = self
                
                
    }
    
    //TODO: implement view controller functionality...

}

extension LeaderboardViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaderBoard.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leaderBoard", for: indexPath) as! LeaderTableViewCell
        cell.labelName.text = leaderBoard[indexPath.row].name
        if let uwStrolls = leaderBoard[indexPath.row].strolls{
            cell.labelStrolls.text = "Strolls: \(uwStrolls)"
        }
        if let uwStreak = leaderBoard[indexPath.row].streak{
            cell.labelStreak.text = "Streak: \(uwStreak)"
        }
        return cell
    }
    
    
}
