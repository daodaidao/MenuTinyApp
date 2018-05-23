//
//  MTAM08ViewController.swift
//  MenuTiny
//
//  Created by caihongguang on 2018/5/23.
//  Copyright © 2018年 SYJ. All rights reserved.
//

import UIKit

class MTAM08ViewController: MTABaseViewController {

    var baseView: UIScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "orange"
        
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.leftBarButtonItem = CoreUtils.HDBackBarButtonItem(#selector(backAction), taget: self)

        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setBackgroundImage(UIImage(named: "main_ico_menu_home"), for: UIControlState())
        
        let rightItem = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = rightItem
        
    }
    
    
    func setupUI(){
        createBaseView()
        
    }
    //滚动视图
    func createBaseView(){
        if baseView == nil {
            
            baseView = UIScrollView()
//            baseView?.backgroundColor = UIColor.blue
            self.view.addSubview(baseView!)
            
            unowned let WS = self
            
            baseView?.snp.makeConstraints({ (make) in
                make.top.equalTo(WS.view).offset(0)
                make.bottom.equalTo(WS.view).offset(0)
                make.right.equalTo(WS.view).offset(0)
                make.left.equalTo(WS.view).offset(0)

            })
//
//            //计算容器大小(具体根据请求的数据)
//            let size =  self.view.bounds.size
//            let
            
            baseView?.contentSize = CGSize(width: MTAConstants.SREENWITH, height: MTAConstants.SREENHEIGHT * 1.5)
            
        }
        
    }
    

}
