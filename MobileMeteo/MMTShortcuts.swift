//
//  MMTShortcuts.swift
//  MobileMeteo
//
//  Created by szostakowskik on 13.12.2017.
//  Copyright © 2017 Kamil Szostakowski. All rights reserved.
//

protocol MMTShortcut
{        
    var identifier: String { get }
    
    func execute(using tabbar: MMTTabBarController, completion: MMTCompletion?)
}

protocol MMTShortcutDispatcher
{
    associatedtype T
    associatedtype V
    
    func convert(from: MMTShortcut) -> T?
    
    func convert(from: V) -> MMTShortcut?
    
    func register(_ shortcut: MMTShortcut)
    
    func unregister(_ shortcut: MMTShortcut)        
}

extension MMTShortcut
{
    func prepare(tabbar: MMTTabBarController, target: UIViewController, completion: @escaping (() -> Void))
    {
        guard let index = tabbar.viewControllers?.index(of: target) else {
            completion()
            return
        }
        
        guard target.presentedViewController == nil else {
            target.dismiss(animated: false, completion: completion)
            return
        }
        
        tabbar.selectedIndex = index
        completion()
    }
}
