//
//  MTATabbarController.swift
//  MenuTiny
//
//  Created by caihongguang on 2018/5/22.
//  Copyright © 2018年 SYJ. All rights reserved.
//

import UIKit

class MTATabbarController: UITabBarController {
    
    var homeVC: MTAHomeViewController!
    var myVC: MTAMyViewController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        self.delegate = self
        setupTabBarView()
        
        
    }
    
   
    
    func setupTabBarView() {
        
        var navc: UINavigationController
        //
        if homeVC == nil {
            
            homeVC = MTAHomeViewController()
            
            homeVC.tabBarItem = UITabBarItem(title: "菜谱", image: UIImage(named: "main_ico_menu_home"), selectedImage: UIImage(named: "main_ico_menu_home"))
            
            navc = UINavigationController(rootViewController: homeVC)
            
            
            //            self.navigationItem.title
            //                = @"my title"; sets navigation bar title.
            //
            //            self.tabBarItem.title
            //                = @"my title"; sets tab bar title.
            //
            //            self.title
            //                = @"my title"; sets both of these.
            
            homeVC.navigationItem.title = "菜-谱"
            
            self.addChildViewController(navc)
        }
        
        
        if myVC == nil {
            
            myVC = MTAMyViewController()
            
            myVC.tabBarItem = UITabBarItem(title: "个人", image: UIImage(named: "main_ico_menu_home"), selectedImage: UIImage(named: "main_ico_menu_home"))
            
            navc = UINavigationController(rootViewController: myVC)

            myVC.navigationItem.title = "我的"
            
            self.addChildViewController(navc)
            
            
        }
        
        
    }
    
    
    
    
    
}
