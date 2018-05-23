//
//  MTABaseViewController.swift
//  MenuTiny
//
//  Created by caihongguang on 2018/5/22.
//  Copyright © 2018年 SYJ. All rights reserved.
//

import UIKit

class MTABaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
     @objc public func backAction() {
        
        navigationController!.popViewController(animated: true)
        
    }
    // MARK: - 提示动画显示和隐藏
    func showHud() {
        
        CoreUtils.showProgressHUD(self.view)
        
    }

}
