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
        
        
        welcomeScrollView.contentSize = CGSize(width: MTAConstants.SREENWITH * 3, height: MTAConstants.SREENHEIGHT)
        
        welcomeScrollView.bounces = false
        
        //是否分页滑动
        welcomeScrollView.isPagingEnabled = true
        
        self.view.addSubview(welcomeScrollView)
        
        welcomeScrollView.snp.makeConstraints { (make) -> Void in
            
            make.top.equalTo(self.view).offset(0)
            make.bottom.equalTo(self.view)
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            
        }
        
        
        welcomeScrollView.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        
        for i in 1...3 {
            
            let imageView = UIImageView()
            imageView.image = UIImage(named: String(format: "guide_step0%d", i))
            welcomeScrollView.addSubview(imageView)
            
            imageView.snp.makeConstraints { (make) in
                make.top.equalTo(welcomeScrollView).offset(0)
                make.left.equalTo(welcomeScrollView).offset(CGFloat(i - 1) * MTAConstants.SREENWITH)
                make.width.equalTo(MTAConstants.SREENWITH)
                make.height.equalTo(MTAConstants.SREENHEIGHT)
            }
            
            if i == 3 {
                
                let btn = UIButton(type: .custom)
                btn.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
                btn.setTitle("立即体验", for: UIControlState())
                btn.layer.cornerRadius = 5
                btn.layer.masksToBounds = true
                
                btn.layer.borderColor = MTAConstants.MTAMainColor.cgColor
                btn.layer.borderWidth = 2
                
                btn.addTarget(self, action:#selector(toMain), for: .touchUpInside)
                
                welcomeScrollView.addSubview(btn)
                
                
                
                
                btn.snp.makeConstraints { (make) in
                    make.bottom.equalTo(welcomeScrollView).offset(MTAConstants.SREENHEIGHT - 100)
                    make.left.equalTo(welcomeScrollView).offset(CGFloat(i - 1) * MTAConstants.SREENWITH + MTAConstants.SREENWITH / 2 - 50)
                    make.width.equalTo(100)
                    make.height.equalTo(30)
                    
                }
                
            }
            
        }
        
        
        
        
    }
    @objc func toMain (){
        
        print("main")
        
        //恢复隐藏状态栏
        UIApplication.shared.isStatusBarHidden = false
        //跳转到tabbar控制器
        UIApplication.shared.delegate?.window??.rootViewController = MTATabbarController()
        
        
    }
    
    
}
