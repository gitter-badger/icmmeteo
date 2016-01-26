//
//  MMTTabBarController.swift
//  MobileMeteo
//
//  Created by Kamil Szostakowski on 17.07.2015.
//  Copyright (c) 2015 Kamil Szostakowski. All rights reserved.
//

import UIKit
import Foundation

class MMTTabBarController: UITabBarController, UITabBarControllerDelegate
{
    override func viewDidLoad()
    {
        super.viewDidLoad()

        delegate = self
        
        initItemAtIndex(0, name: "Model UM", store: MMTUmModelStore(date: NSDate()))
        initItemAtIndex(1, name: "Model COAMPS", store: MMTCoampsModelStore(date: NSDate()))

        let attributes = [NSFontAttributeName: MMTAppearance.fontWithSize(10)]

        UITabBarItem.appearance().setTitleTextAttributes(attributes, forState: UIControlState.Normal)
        UITabBarItem.appearance().setTitleTextAttributes(attributes, forState: UIControlState.Selected)
        UITabBar.appearance().tintColor = MMTAppearance.textColor
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask
    {
        if presentedViewController is MMTMeteorogramController {
            return .AllButUpsideDown
        }
        
        return .Portrait
    }
    
    // MARK: UITabBarControllerDelegate methods
    
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController)
    {
        guard let index =  tabBarController.viewControllers?.indexOf(viewController) else {
            return
        }

        let tabBarItems = tabBar.layer.sublayers!
            .filter(){ $0.frame.size.width < tabBar.frame.size.width }
            .sort(){ $0.frame.origin.x < $1.frame.origin.x }
            .map() {
                $0.sublayers!.maxElement(){ $0.frame.size.height < $1.frame.size.height }!
        }
            
        tabBarItems[index].addAnimation(CAAnimation.defaultScaleAnimation(), forKey: "basic")
    }
    
    // MARK: Helper methods
    
    private func initItemAtIndex(index: Int, name: String, store: MMTGridClimateModelStore)
    {
        let iconName = name.lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: "-")
        let icon = UIImage(named: iconName)
        
        let
        controller = viewControllers?[index] as! MMTCitiesListController
        controller.meteorogramStore = store
        
        let
        item = tabBar.items![index]
        item.title = name
        item.image = icon
        item.selectedImage = icon
    }
}