//
//  LeaderboardViewController.swift
//  stroll
//
//  Created by Chapin Alf on 10/30/23.
//

import UIKit

class LeaderboardViewController: UIViewController {

    let leaderboardView = LeaderboardView()
    
    //MARK: load the view...
    override func loadView() {
        view = leaderboardView
    }

    //MARK: do on load...
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Leaderboard"
    }
    
    //TODO: implement view controller functionality...

}
