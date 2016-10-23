//
//  AppDelegate.swift
//  VolunteerWebsites
//
//  Created by Zoe on 10/5/16.
//  Copyright © 2016 Zoe. All rights reserved.
//

import UIKit
import Firebase

func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
    let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
    let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
    let blue = CGFloat(rgbValue & 0xFF)/256.0
    
    return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?
   
    
   

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        FIRApp.configure()
       
        
        //let splitViewController = self.window!.rootViewController as! UISplitViewController
        let tabBarViewController = self.window!.rootViewController as! UITabBarController
        var splitViewControllerOne:UISplitViewController? = nil
        var splitViewControllerTwo:UISplitViewController? = nil
        var splitViewControllerThree:UISplitViewController? = nil
        var splitViewControllerFour:UISplitViewController? = nil
        
        for viewController in tabBarViewController.viewControllers! {
            if viewController.title == "Master1" {
                splitViewControllerOne = viewController as? UISplitViewController
            } else if viewController.title == "Master2" {
                splitViewControllerTwo = viewController as? UISplitViewController
            } else if viewController.title == "Master3" {
                splitViewControllerThree = viewController as? UISplitViewController
            } else if viewController.title == "Master4" {
                splitViewControllerFour = viewController as? UISplitViewController
            }
        }
        
        let navigationController = splitViewControllerOne!.viewControllers[splitViewControllerOne!.viewControllers.count-1] as! UINavigationController
        //navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem()
        
        var navigationBarAppearance = UINavigationBar.appearance()
        
        navigationBarAppearance.barTintColor = UIColorFromHex(0x66CCCC, alpha: 1.0)
        
        
        splitViewControllerOne!.delegate = self
        splitViewControllerTwo!.delegate = self
        splitViewControllerThree!.delegate = self
        splitViewControllerFour!.delegate = self
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: - Split view

    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController:UIViewController, ontoPrimaryViewController primaryViewController:UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return false }
        if topAsDetailController.detailItem == nil {
            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
            return true
        }
        return false
    }

}

