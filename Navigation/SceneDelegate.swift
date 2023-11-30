//
//  SceneDelegate.swift
//  Navigation_2.0
//
//  Created by Alexander Balash on 18.09.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow (windowScene: scene)
        
        let feedViewController = FeedViewController()
        feedViewController.title = "Лента"
        feedViewController.view.backgroundColor = .systemIndigo
        
        let profileViewController = LoginViewController ()
        profileViewController.title = "My profile"
        
        let postViewController = PostViewController()
        postViewController.title = "Мой пост"
        postViewController.view.backgroundColor = .systemGray3
        
        let tabBarViewController = UITabBarController()
        tabBarViewController.view.backgroundColor = .systemTeal
        
        feedViewController.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "house.fill"),tag: 0)
        
        profileViewController.tabBarItem = UITabBarItem(title: "Профиль", image:UIImage(systemName: "person.crop.circle.fill") , tag: 1)
        postViewController.tabBarItem = UITabBarItem (title: "Добавить пост", image:UIImage(systemName: "pencil.tip.crop.circle.badge.plus") , tag: 2)
        
        let controllers = [feedViewController,profileViewController]
        tabBarViewController.viewControllers = controllers.map {
            UINavigationController(rootViewController: $0)
        }
        tabBarViewController.selectedIndex = 0
        
        
        
        window.rootViewController = tabBarViewController
        window.makeKeyAndVisible()
        
        self.window =  window
    }
    
    
    func sceneDidDisconnect(_ scene: UIScene) {
        
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }
}

