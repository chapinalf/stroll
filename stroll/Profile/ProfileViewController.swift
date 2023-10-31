//
//  ProfileViewController.swift
//  stroll
//
//  Created by Chapin Alf on 10/30/23.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileView = ProfileView()
    
    //MARK: Load the view
    override func loadView() {
        view = profileView
    }

    //MARK: Do on load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Profile"
    }
    
    //TODO: Implement view controller functionality

}
