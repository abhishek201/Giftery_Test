//
//  AppDelegate.swift
//  Giftery
//
//  Created by abhishek on 17/02/18.
//  Copyright © 2018 abhishek. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        makeTabBarRoot()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    // this function will be called to make tab bar root
    func makeTabBarRoot()
    {
        
        UIApplication.shared.statusBarStyle = .lightContent
        let storyboard  = UIStoryboard(name: "Main", bundle: nil)
        var tabbar = storyboard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
        
        var navigationController =  UINavigationController(rootViewController: tabbar)
        navigationController.navigationBar.isHidden = true
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        let tabbar_item = tabbar.tabBar as! UITabBar
        let tabEvent = tabbar_item.items![0]
        tabEvent.title = "Events" // tabbar titlee
        tabEvent.image=event_image.withRenderingMode(.alwaysOriginal) //deselect image
        tabEvent.selectedImage = event_image_selected.withRenderingMode(.alwaysOriginal) //select image
        
        let tabLOrder = tabbar_item.items![1]
        tabLOrder.title = "Orders"
        tabLOrder.image=orders_image.withRenderingMode(.alwaysOriginal)
        tabLOrder.selectedImage=orders_image_selected.withRenderingMode(.alwaysOriginal)
    
        let tabGift = tabbar_item.items![2]
        tabGift.title = "Gift"
       // tabGift.image=gift_image.withRenderingMode(.alwaysOriginal)
       // tabGift.selectedImage=gift_image.withRenderingMode(.alwaysOriginal)
        
        let tabMe = tabbar_item.items![3]
        tabMe.title = "Me"
        tabMe.image=me_image.withRenderingMode(.alwaysOriginal)
        tabMe.selectedImage=me_image_selected.withRenderingMode(.alwaysOriginal)
        
        let attributes = [NSAttributedStringKey.font:UIFont(name: regular_font, size: CGFloat(minimum_font))!,NSAttributedStringKey.foregroundColor:tab_selected_color]
        
        let attributes1 = [NSAttributedStringKey.font:UIFont(name: regular_font, size: CGFloat(minimum_font))!,NSAttributedStringKey.foregroundColor:UIColor.white]
        
        UITabBarItem.appearance().setTitleTextAttributes(attributes1, for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .selected)
      //  tabbar.tabBar.backgroundColor = UIColor(red: 140.0/255.0, green: 108.0/255.0, blue: 117.0/255.0, alpha: 1.0)
       // tabbar.tabBar.tintColor = UIColor.clear
    }

}

