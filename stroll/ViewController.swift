//
//  ViewController.swift
//  stroll
//
//  Created by Chapin Alf on 10/30/23.
//

import UIKit

class ViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //MARK: setting up homepage bar...
        let tabHomepage = UINavigationController(rootViewController: HomepageViewController())
        let tabHomepageBarItem = UITabBarItem(
            title: "Homepage",
            image: UIImage(systemName: "house")?.withRenderingMode(.alwaysTemplate),
            selectedImage: UIImage(systemName: "house.fill")
        )
        tabHomepage.tabBarItem = tabHomepageBarItem
        tabHomepage.title = "Homepage"
        
        //MARK: setting up journey bar...
        let tabJourney = UINavigationController(rootViewController: JourneyViewController())
        let tabJourneyBarItem = UITabBarItem(
            title: "Journey",
            image: UIImage(systemName: "point.bottomleft.forward.to.point.topright.scurvepath")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(systemName: "point.bottomleft.forward.to.point.topright.scurvepath.fill")
        )
        tabJourney.tabBarItem = tabJourneyBarItem
        tabJourney.title = "Journey"
        
        //MARK: setting up leaderboard tab bar...
        let tabLeaderboard = UINavigationController(rootViewController: LeaderboardViewController())
        let tabLeaderboardBarItem = UITabBarItem(
            title: "Leaderboard",
            image: UIImage(systemName: "trophy")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(systemName: "trophy.fill")
        )
        tabLeaderboard.tabBarItem = tabLeaderboardBarItem
        tabLeaderboard.title = "Leaderboard"
        
        //MARK: setting up profile tab bar...
        let tabProfile = UINavigationController(rootViewController: ProfileViewController())
        let tabProfileBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(systemName: "person.fill")
        )
        tabProfile.tabBarItem = tabProfileBarItem
        tabProfile.title = "Profile"
        
        //MARK: setting up this view controller as the Tab Bar Controller...
        self.viewControllers = [tabHomepage, tabJourney, tabLeaderboard, tabProfile]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

