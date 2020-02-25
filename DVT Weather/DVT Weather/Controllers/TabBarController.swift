//
//  TabBarController.swift
//  SwipeableTabBarController
//
//  Created by Marcos Griselli on 2/1/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import SwipeableTabBarController
import UIKit
import SwiftyJSON
class TabBarController: SwipeableTabBarController {
   // let pref = PreferenUtils()
    override func viewDidLoad() {
        super.viewDidLoad()
     //   updatetokenToDb()
        if let viewControllers = viewControllers {
            selectedViewController = viewControllers[0]
        }
//        if #available(iOS 11.0, *) {
//            view.backgroundColor = UIColor(named: "mainColor")
//        } else {
//            // Fallback on earlier versions
//        }
//        UITabBar.appearance().barTintColor = UIColor.black // your color
        
        /// Set the animation type for swipe
        swipeAnimatedTransitioning?.animationType = SwipeAnimationType.sideBySide
        
        /// Set the animation type for tap
        tapAnimatedTransitioning?.animationType = SwipeAnimationType.push
        
        /// if you want cycling switch tab, set true 'isCyclingEnabled'
        isCyclingEnabled = true
        
        /// Disable custom transition on tap.
        //tapAnimatedTransitioning = nil
        
        /// Set swipe to only work when strictly horizontal.
        //        diagonalSwipeEnabled = true
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // Handle didSelect viewController method here
    }
    
}
