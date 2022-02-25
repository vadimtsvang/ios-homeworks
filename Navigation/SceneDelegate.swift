//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Vadim on 13.01.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.makeKeyAndVisible()
        
        let tabBarController = UITabBarController()
        
        let feedVC = FeedViewController()
        feedVC.view.backgroundColor = .systemGreen
        feedVC.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "doc.append.fill"), tag: 0)
        
        let profileVC = ProfileViewController()
        profileVC.view.backgroundColor = .systemTeal
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.rectangle.fill"), tag: 1)
        
        let feedNC = UINavigationController(rootViewController: feedVC)
        
        tabBarController.viewControllers = [feedNC, profileVC]
        
        
        window?.rootViewController = tabBarController
        
    }
}
