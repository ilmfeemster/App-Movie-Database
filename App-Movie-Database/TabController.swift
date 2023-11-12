//
//  TabController.swift
//  App-Movie-Database
//
//  Created by Immanuel Matthews-Feemster on 11/5/23.
//

import UIKit

class TabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()

    }
    
    private func setupTabs() {
        let home = self.createNav(with: "Home", and: UIImage(systemName: "house"), vc: HomeController())
        let search = self.createNav(with: "Search", and: UIImage(systemName: "magnifyingglass"), vc: SearchController())
        let settings = self.createNav(with: "Settings", and: UIImage(systemName: "gear"), vc: SettingsController())
        let profile = self.createNav(with: "Profile", and: UIImage(systemName: "person.circle.fill"), vc: ProfileController())
        
        self.setViewControllers([home, search, settings, profile], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        nav.viewControllers.first?.navigationItem.title = title
        return nav
    }
}
