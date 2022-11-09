//
//  AppDelegate.swift
//  DictionaryWithTolga
//
//  Created by Talip on 2.11.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        startApplication()
        return true
    }
    
    private func startApplication() {
        let database = CoreDataManager(modelName: "DictionaryWithTolga")
        let wordListViewController = WordListViewController(database: database)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: wordListViewController)
        window?.makeKeyAndVisible()
    }
}
