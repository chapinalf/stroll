//
//  WelcomeViewController.swift
//  stroll
//
//  Created by Chapin Alf on 10/30/23.
//

import UIKit

class WelcomeViewController: UIViewController {

    let welcomeView = WelcomeView()
    
    //MARK: Load the view
    override func loadView() {
        view = welcomeView
    }

    //MARK: Do on load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Welcome"
        navigationItem.setHidesBackButton(true, animated: true)
    }
    
    //TODO: Implement view controller functionality

}
