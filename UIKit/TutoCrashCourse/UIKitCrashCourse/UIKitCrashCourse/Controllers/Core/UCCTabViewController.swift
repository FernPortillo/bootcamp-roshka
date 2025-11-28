//
//  ViewController.swift
//  UIKitCrashCourse
//
//  Created by Bootcamp on 2025-11-28.
//

import UIKit

/// Controller que maneja las tabs y que asigna las tab a la tabbar
final class UCCTabViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpTabs()
        print("TabBarCargada")
        
    }

    
    private func setUpTabs()
    {
        let characterVC = UCCCharacterViewController()
        let episodeVC = UCCEpisodeViewController()
        let locationVC = UCCLocationViewController()
        let settingsVC = UCCSettingsViewController()
        
        let nav1 = UINavigationController(rootViewController: characterVC)
        let nav2 = UINavigationController(rootViewController: episodeVC)
        let nav3 = UINavigationController(rootViewController: locationVC)
        let nav4 = UINavigationController(rootViewController: settingsVC)
        
        nav1.tabBarItem = UITabBarItem(title: characterVC.title,
                                       image: UIImage(systemName: characterVC.icon),
                                       tag: 1)
        nav2.tabBarItem = UITabBarItem(title: episodeVC.title,
                                       image: UIImage(systemName: episodeVC.icon),
                                       tag: 2)
        nav3.tabBarItem = UITabBarItem(title: locationVC.title,
                                       image: UIImage(systemName: locationVC.icon),
                                       tag: 3)
        nav4.tabBarItem = UITabBarItem(title: settingsVC.title,
                                       image: UIImage(systemName: settingsVC.icon),
                                       tag: 4)
        
        for nav in [nav1, nav2, nav3, nav4]
        {
            nav.navigationBar.prefersLargeTitles = true
        }

        
        setViewControllers(
            [nav1, nav2, nav3, nav4],
            animated: true)
    }


}

