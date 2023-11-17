//
//  LeaderboardView.swift
//  stroll
//
//  Created by Chapin Alf on 10/30/23.
//

import UIKit

class LeaderboardView: UIView {

    var tableViewLeaderboard: UITableView!
    var yourStatsContainer: UIView!
    
    var labelYourStats: UILabel!
    var labelStrollNum: UILabel!
    var labelStreakNum: UILabel!
    var labelStrolls: UILabel!
    var labelStreak: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: set the background color...
        self.backgroundColor = .white
        
        //MARK: initializing the UI elements and constraints...

        setupTableViewLeaderboard()
        setupYourStatsContainer()
        
        setupLabelYourStats()
        setupLabelStrolls()
        setupLabelStreak()
        setupLabelStreakNum()
        setupLabelStrollNum()
        
        initConstraints()
    }
    
    //MARK: initializing the UI elements...
    func setupTableViewLeaderboard(){
        
        tableViewLeaderboard = UITableView()
        tableViewLeaderboard.register(LeaderTableViewCell.self, forCellReuseIdentifier: "leaderBoard")
        tableViewLeaderboard.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(tableViewLeaderboard)

//       tableViewLeaderboard.register(User1MessagesTableViewCell.self, forCellReuseIdentifier: Configs.tableViewMessagesID1)
//        tableViewLeaderboard.register(User2MessagesTableViewCell.self, forCellReuseIdentifier: Configs.tableViewMessagesID2)
    }
    
    func setupYourStatsContainer() {
        yourStatsContainer = UIView()
        yourStatsContainer.translatesAutoresizingMaskIntoConstraints = false
        yourStatsContainer.backgroundColor = UIColor.white
        self.addSubview(yourStatsContainer)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabelYourStats(){
        labelYourStats = UILabel()
        labelYourStats.textColor = UIColor.black
        labelYourStats.font = UIFont.boldSystemFont(ofSize: 22.0)
        labelYourStats.translatesAutoresizingMaskIntoConstraints = false
        labelYourStats.text = "Your Statistics:"
        yourStatsContainer.addSubview(labelYourStats)
    }
    
    func setupLabelStrollNum(){
        labelStrollNum = UILabel()
        labelStrollNum.textColor = UIColor.black
        labelStrollNum.font = UIFont.boldSystemFont(ofSize: 50)
        labelStrollNum.translatesAutoresizingMaskIntoConstraints = false
        labelStrollNum.text = "50"
        yourStatsContainer.addSubview(labelStrollNum)
    }
    
    func setupLabelStreakNum(){
        labelStreakNum = UILabel()
        labelStreakNum.textColor = UIColor.black
        labelStreakNum.font = UIFont.boldSystemFont(ofSize: 50)
        labelStreakNum.translatesAutoresizingMaskIntoConstraints = false
        labelStreakNum.text = "45"
        yourStatsContainer.addSubview(labelStreakNum)
    }
    
    func setupLabelStrolls(){
        labelStrolls = UILabel()
        labelStrolls.textColor = UIColor.black
        labelStrolls.font = UIFont.boldSystemFont(ofSize: 15)
        labelStrolls.translatesAutoresizingMaskIntoConstraints = false
        labelStrolls.text = "Strolls"
        yourStatsContainer.addSubview(labelStrolls)
    }
    
    func setupLabelStreak(){
        labelStreak = UILabel()
        labelStreak.textColor = UIColor.black
        labelStreak.font = UIFont.boldSystemFont(ofSize: 15)
        labelStreak.translatesAutoresizingMaskIntoConstraints = false
        labelStreak.text = "Streak"
        yourStatsContainer.addSubview(labelStreak)
    }
    
    //MARK: initializing constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
 
            tableViewLeaderboard.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            tableViewLeaderboard.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            tableViewLeaderboard.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            tableViewLeaderboard.heightAnchor.constraint(equalToConstant: 500),
            
            yourStatsContainer.topAnchor.constraint(equalTo: tableViewLeaderboard.bottomAnchor),
            yourStatsContainer.leadingAnchor.constraint(equalTo:  self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            yourStatsContainer.trailingAnchor.constraint(equalTo:  self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            yourStatsContainer.bottomAnchor.constraint(equalTo:  self.keyboardLayoutGuide.topAnchor, constant: -8),
            
            labelYourStats.topAnchor.constraint(equalTo: yourStatsContainer.topAnchor, constant: 8),
            labelYourStats.leadingAnchor.constraint(equalTo: yourStatsContainer.leadingAnchor, constant: 8),
            labelYourStats.trailingAnchor.constraint(equalTo: yourStatsContainer.trailingAnchor, constant: -8),
            
            labelStrollNum.topAnchor.constraint(equalTo: labelYourStats.bottomAnchor, constant: 15),
            labelStrollNum.leadingAnchor.constraint(equalTo: yourStatsContainer.leadingAnchor, constant: 100),
            labelStrollNum.trailingAnchor.constraint(equalTo: yourStatsContainer.trailingAnchor, constant: -8),
            
            labelStreakNum.topAnchor.constraint(equalTo: labelYourStats.bottomAnchor, constant: 15),
            labelStreakNum.leadingAnchor.constraint(equalTo: yourStatsContainer.leadingAnchor, constant: 207),
            labelStreakNum.trailingAnchor.constraint(equalTo: yourStatsContainer.trailingAnchor, constant: -8),
            
            labelStrolls.topAnchor.constraint(equalTo: labelYourStats.bottomAnchor, constant: 70),
            labelStrolls.leadingAnchor.constraint(equalTo: yourStatsContainer.leadingAnchor, constant: 107),
            labelStrolls.trailingAnchor.constraint(equalTo: yourStatsContainer.trailingAnchor, constant: -8),
            
            labelStreak.topAnchor.constraint(equalTo: labelYourStats.bottomAnchor, constant: 70),
            labelStreak.leadingAnchor.constraint(equalTo: yourStatsContainer.leadingAnchor, constant: 215),
            labelStreak.trailingAnchor.constraint(equalTo: yourStatsContainer.trailingAnchor, constant: -8),
        ])
    }
    
}
