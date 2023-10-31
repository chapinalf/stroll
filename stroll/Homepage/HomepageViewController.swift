//
//  HomepageViewController.swift
//  stroll
//
//  Created by Chapin Alf on 10/31/23.
//

import UIKit

class HomepageViewController: UIViewController {

    let homepageView = HomepageView()
    
    //MARK: Load the view
    override func loadView() {
        view = homepageView
    }

    //MARK: Do on load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Homepage"
    }
    
    //TODO: Implement view controller functionality

}
