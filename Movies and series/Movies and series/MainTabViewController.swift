//
//  ViewController.swift
//  Movies and series
//
//  Created by Русинов Евгений on 29.03.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {
    

    override func viewDidLoad() {
        self.tabBar.tintColor = .red
        self.tabBar.backgroundColor = .systemBlue
        self.tabBar.barTintColor = .white
        super.viewDidLoad()
        generateTabBar()
    }
    
    
    private func generateTabBar() {
        viewControllers = [
        generateVC(viewController: UINavigationController(rootViewController: SearchViewController()), title: "Search", image: UIImage(systemName: "magnifyingglass")),
        generateVC(viewController: WaitListViewController(), title: "Saved", image: UIImage(systemName: "star.circle"))]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
}
