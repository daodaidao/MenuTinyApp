//
//  AppDelegate.swift
//  MenuTiny
//
//  Created by caihongguang on 2018/5/21.
//  Copyright © 2018年 SYJ. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        //显示欢迎页面或者TabbarController主页面
        showWelcome()
        //设置导航栏和tabbar样式
          setUpBarStyle();
        
        
        
        return true
    }
    
    //MARK: - 欢迎界面
    func showWelcome(){
         //判断欢迎页面是否已经执行
        let userDefault = UserDefaults.standard
        let appVersion: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        
//        //是否是第一次进入
        if(userDefault.string(forKey:MTAConstants.HDAppVersion))  == nil
        {
            //第一次进入
            print("第一次进入")
            userDefault.setValue(appVersion, forKey: MTAConstants.HDAppVersion)
            userDefault.synchronize()
            
            self.window?.rootViewController = MTAWelcomeViewController()
            
            
        }else {

            print("不是第一次进入")
            self.window?.rootViewController = MTATabbarController()

        }
    
        
    }
    
    //  MARK: - 设置导航栏和标签栏样式
    func setUpBarStyle() {
        
        /**
         *  导航栏样式
         */
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "Heiti SC", size: 18.0)!]
        UINavigationBar.appearance().barTintColor = MTAConstants.MTAMainColor
        //        UINavigationBar.appearance().barTintColor = CoreUtils.HDColor(245, g: 161, b: 0, a: 1)
        /**
         *  状态栏字体设置白色
         */
        //        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
        
        /**
         *  底部TabBar的颜色
         */
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().tintColor = CoreUtils.HDfromHexValue(0xFFFFFF, alpha: 1.0)
        UITabBar.appearance().backgroundColor = CoreUtils.HDfromHexValue(0xFFFFFF, alpha: 1.0)
        UITabBar.appearance().barTintColor = CoreUtils.HDfromHexValue(0xFFFFFF, alpha: 1.0)
        //        UITabBar.appearance().selectedImageTintColor = UIColor.clearColor()
        
        /**
         *  底部TabBar字体正常状态颜色
         */
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: MTAConstants.HDMainTextColor, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13)], for: UIControlState.normal)
        /**
         *  底部TabBar字体选择状态颜色
         */
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: MTAConstants.MTAMainColor, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13)], for: UIControlState.selected)
        
    }
    
 


}

