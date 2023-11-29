//
//  HomepageViewController.swift
//  stroll
//
//  Created by Chapin Alf on 10/31/23.
//

import UIKit
import MapKit

class HomepageViewController: UIViewController {

    let homepageView = HomepageView()
    
    //MARK: load the view...
    override func loadView() {
        view = homepageView
    }

    //MARK: do on load...
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Homepage"
        
        homepageView.startButton.addTarget(self, action: #selector(onStartButtonTapped), for: .touchUpInside)
    }
    
    @objc func onStartButtonTapped() {
        if let tabBarController = tabBarController {
            tabBarController.selectedIndex = 1 // Index of the "Journey" tab
        }
    }
    
}
