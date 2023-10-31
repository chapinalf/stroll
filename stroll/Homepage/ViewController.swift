//
//  ViewController.swift
//  stroll
//
//  Created by Chapin Alf on 10/30/23.
//

import UIKit

class ViewController: UIViewController {
    
    let homepageView = HomepageView()
    
    //MARK: Load the view
    override func loadView() {
        view = homepageView
    }

    //MARK: Do on load
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

