//
//  SYJRefreshGifFooter.swift
//  MenuTiny
//
//  Created by caihongguang on 2018/5/24.
//  Copyright © 2018年 SYJ. All rights reserved.
//

import UIKit

class SYJRefreshGifFooter: MJRefreshAutoGifFooter {

    
    override func prepare(){
        
        super.prepare()
        
        let idleImages = NSMutableArray()
        for i in 1 ..< 3 {
            
            let name: String = String(format: "Refresh%ld", i)
            
            let image = UIImage(named: name)
            
            idleImages.add(image!)
            
        }
        
        //设置普通状态的动画图片
        self.setImages(idleImages as [AnyObject], for: MJRefreshState.idle)
        
        let refreshingImages = NSMutableArray()
        
        for i in 1 ..< 10 {
            let name:String = String(format:"Refresh%ld",i)
            
            let image = UIImage(named: name)
            
            refreshingImages.add(image!)
            
        }
        
        //设置即将刷新状态的动画图片 (一松开就会刷新的状态)
        self.setImages(refreshingImages as [AnyObject], for: MJRefreshState.pulling)
        
        
        //设置正在刷新状态的动画图片
        self.setImages(refreshingImages as [AnyObject], for: MJRefreshState.refreshing)
        
        
    }
    
    
}
