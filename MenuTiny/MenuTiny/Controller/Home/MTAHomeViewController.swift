//
//  MTAHomeViewController.swift
//  MenuTiny
//
//  Created by caihongguang on 2018/5/22.
//  Copyright © 2018年 SYJ. All rights reserved.
//

import UIKit

private let HeadViewHeight : CGFloat = 200.0

class MTAHomeViewController: MTABaseViewController {
    
    
    /**
     *   UIImageView重用
     */
    var index: Int?
    var centerImageView: UIImageView?
    var leftImageView: UIImageView?
    var rightImageView: UIImageView?
    
    /// 头部滚动视图
    var headView: UIView!
    var headerScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置布局是否沿着整个屏幕,防止视图被navigationBar挡住
        self.edgesForExtendedLayout = UIRectEdge();
        
        self.navigationController?.navigationBar.isTranslucent = false
        
        
        createHeaderView()
        
        
    }
    
    //创建头部滚动视图
    
    func createHeaderView(){
        /// 创建容器
        if headView == nil {
            headView = UIView()
            self.view.addSubview(headView)
            headView.snp.makeConstraints { (make) in
                make.top.equalTo(self.view).offset(0)
                make.left.equalTo(self.view).offset(0)
                make.width.equalTo(MTAConstants.SREENWITH)
                make.height.equalTo(HeadViewHeight)
            }
            headView.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
        
        if headerScrollView == nil {
            
            headerScrollView = UIScrollView()
            headerScrollView.bounces = false
            headerScrollView.isPagingEnabled = true
            headerScrollView.contentSize = CGSize(width: 3 * MTAConstants.SREENWITH, height: HeadViewHeight)
            headView.addSubview(headerScrollView)
            
            headerScrollView.snp.makeConstraints { (make) in
                
                make.top.equalTo(headView).offset(0)
                make.left.equalTo(headView).offset(0)
                make.width.equalTo(MTAConstants.SREENWITH)
                make.height.equalTo(HeadViewHeight)
                
            }
            
            
            
        }
        
        centerImageView = UIImageView(frame: CGRect(x: MTAConstants.SREENWITH, y: 0, width: MTAConstants.SREENWITH, height: HeadViewHeight))
        headerScrollView.addSubview(centerImageView)
        
        
        
        
        
        
        
        
    }
    
    
    
}
