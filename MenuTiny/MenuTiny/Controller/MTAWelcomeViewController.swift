//
//  MTAWelcomeViewController.swift
//  MenuTiny
//
//  Created by caihongguang on 2018/5/22.
//  Copyright © 2018年 SYJ. All rights reserved.
//

import UIKit
import SnapKit

class MTAWelcomeViewController: UIViewController {

    let welcomeScrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        //隐藏状态栏
        UIApplication.shared.isStatusBarHidden = true
        
        self.view.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        
        setupUI()
        
    }
    
    func setupUI(){
        
        
//        welcomeScrollView.contentSize = CGSize
        
        self.view.addSubview(welcomeScrollView)
        
        welcomeScrollView.snp.makeConstraints { (make) -> Void in
            
            make.top.equalTo(self.view).offset(0)
            make.bottom.equalTo(self.view)
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            
        }
        welcomeScrollView.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        
        
        
      
        
    }

    

}
