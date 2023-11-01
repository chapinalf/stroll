//
//  ViewController.swift
//  stroll
//
//  Created by Chapin Alf on 10/30/23.
//

import UIKit

class ViewController: UITabBarController, UITabBarControllerDelegate {

    let defaults = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //MARK: setting up welcome...
        //TODO: FIX SO THIS ONLY SHOWS UP IF LOGGED IN!!!
        let welcome = UINavigationController(rootViewController: WelcomeViewController())
        
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
        
        self.viewControllers = [welcome, tabHomepage, tabJourney, tabLeaderboard, tabProfile]
    }
    
    //MARK: do on load...
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

