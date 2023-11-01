//
//  JourneyViewController.swift
//  stroll
//
//  Created by Chapin Alf on 10/30/23.
//

import UIKit

class JourneyViewController: UIViewController {

    let journeyView = JourneyView()
    
    //MARK: load the view...
    override func loadView() {
        view = journeyView
    }

    //MARK: do on load...
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Journey"
    }
    
    //TODO: implement view controller functionality...

}
