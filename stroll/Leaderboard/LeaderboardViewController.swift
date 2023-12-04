//
//  LeaderboardViewController.swift
//  stroll
//
//  Created by Chapin Alf on 10/30/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class LeaderboardViewController: UIViewController {

    let leaderboardView = LeaderboardView()
    let database = Firestore.firestore()
    
    var leaderBoard = [Leader]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //MARK: observe firestore database to display the profile information...
        database.collection("users").document((Auth.auth().currentUser?.email)!).addSnapshotListener { documentSnapshot, error in
              
              if let document = documentSnapshot {
                      do{
                          let user = try document.data(as: User.self)
                          self.leaderboardView.labelStrollNum.text = String(user.strollsTotal)
                          self.leaderboardView.labelStreakNum.text = String(user.strollsStreak)
                      }catch{
                          print(error)
                          self.showErrorAlert("Could not load profile!", "The profile could not be loaded. Please try again later!")
                      }
                  }
          }
        
        self.database.collection("users")
            .addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
                if let documents = querySnapshot?.documents{
                    self.leaderBoard.removeAll()
                    for document in documents{
                        do{
                            let leader = try document.data(as: Leader.self)
                            self.leaderBoard.append(leader)
                        }catch{
                            print(error)
                        }
                    }
                    self.leaderBoard.sort(by: {$0.strollsStreak! > $1.strollsStreak!})
                    self.leaderboardView.tableViewLeaderboard.reloadData()
                }
            })
        
    }
    
    //MARK: load the view...
    override func loadView() {
        view = leaderboardView
    }

    //MARK: do on load...
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Leaderboard"
        
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
        cell.selectionStyle = .none
        cell.labelName.text = leaderBoard[indexPath.row].name
        if let uwStrolls = leaderBoard[indexPath.row].strollsTotal{
            cell.labelStrolls.text = "\(uwStrolls)"
        }
        if let uwStreak = leaderBoard[indexPath.row].strollsStreak{
            cell.labelStreak.text = "\(uwStreak)"
        }
        return cell
    }
    
    
    //MARK: show error alert...
    func showErrorAlert(_ errorTitle: String, _ errorMessage: String){
        let alert = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    
}
