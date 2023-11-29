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
    }
    
    //TODO: implement view controller functionality...
    
}
