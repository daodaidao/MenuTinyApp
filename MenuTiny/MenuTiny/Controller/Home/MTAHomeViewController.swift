//
//  MTAHomeViewController.swift
//  MenuTiny
//
//  Created by caihongguang on 2018/5/22.
//  Copyright © 2018年 SYJ. All rights reserved.
//

import UIKit
import Kingfisher


private let HeadViewHeight : CGFloat = 200.0

private let resourceArray  = [["title": "排行榜", "image": "HPHBIcon"],["title": "营养餐桌", "image": "HPHBIcon"],["title": "热门分类", "image": "HPHBIcon"],["title": "晒一晒", "image": "HPHBIcon"]]

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
    
    // 分页栏
    var pageControl: UIPageControl!
    
    //标签栏
    var menuView: UIView!
    
    var tagListView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置布局是否沿着整个屏幕,防止视图被navigationBar挡住
        self.edgesForExtendedLayout = UIRectEdge();
        
        self.navigationController?.navigationBar.isTranslucent = false
       
        
        
        
        setupUI()
        
      
    }
    
    func setupUI(){
        
        
        createHeaderView()
        //创建标签
        createMenuView()
        
        createTagListView()
        
    }
    
    func createMenuView(){
        
        if menuView == nil {
            menuView = UIView()
            menuView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            self.view.addSubview(menuView)
            menuView.snp.makeConstraints { (make) in
                make.top.equalTo(headView.snp.bottom).offset(0)
                make.left.equalTo(self.view).offset(0)
                make.width.equalTo(headView)
                make.height.equalTo(HeadViewHeight / 2)
            }
        }
        
        
        for i in 0 ..< resourceArray.count {
            var btn : HDHM01Button?
            
            btn = menuView.viewWithTag(i + 300) as? HDHM01Button
            if btn == nil {
                btn = HDHM01Button()
                btn?.tag = i + 300
                btn?.setImage(UIImage(named: resourceArray[i]["image"]!), for: UIControlState())
                btn?.setTitle(resourceArray[i]["title"], for: UIControlState())
                btn!.titleLabel?.font = UIFont.systemFont(ofSize: 15)
                
                btn?.titleLabel?.textAlignment = NSTextAlignment.center
                
                menuView.addSubview(btn!)
                btn?.snp.makeConstraints({ (make) in
                    
                    make.left.equalTo(menuView).offset(CGFloat(i) * MTAConstants.SREENWITH / 4)
                    make.top.equalTo(menuView).offset(0)
                    make.width.equalTo(MTAConstants.SREENWITH / 4)
                    make.height.equalTo(MTAConstants.SREENWITH / 4)
                    
                })
                
                
                
                
            }
            
            
            
        }
        
        
        
        
    }
    
    //按钮
    func createTagListView(){
        
        if tagListView == nil {
            tagListView = UIView()
            tagListView.backgroundColor = UIColor.green
            self.view.addSubview(tagListView)
            
            tagListView.snp.makeConstraints { (make) in
                
                make.top.equalTo(menuView.snp.bottom).offset(MTAConstants.HDSpace)
                make.left.equalTo(0)
                make.width.equalTo(MTAConstants.SREENWITH)
                make.height.equalTo(100)
            }
            
            
        }
        
        
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
            
            headerScrollView.showsHorizontalScrollIndicator = false
            headerScrollView.contentSize = CGSize(width: 3 * MTAConstants.SREENWITH, height: HeadViewHeight)
            headView.addSubview(headerScrollView)
            
            headerScrollView.snp.makeConstraints { (make) in
                
                make.top.equalTo(headView).offset(0)
                make.left.equalTo(headView).offset(0)
                make.width.equalTo(MTAConstants.SREENWITH)
                make.height.equalTo(HeadViewHeight)
                
            }
            
            
            
        }
        
        leftImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: MTAConstants.SREENWITH, height: HeadViewHeight))
        headerScrollView.addSubview(leftImageView!)
        
        leftImageView?.kf.setImage(with: URL(string: "http://img1.hoto.cn/haodou/recipev4/wiki/1d5ff0c46.jpg"))
        
        centerImageView = UIImageView(frame: CGRect(x: MTAConstants.SREENWITH, y: 0, width: MTAConstants.SREENWITH, height: HeadViewHeight))
        headerScrollView.addSubview(centerImageView!)
        
        centerImageView?.kf.setImage(with: URL(string: "http://img1.hoto.cn/haodou/recipev4/wiki/1d5ff0c46.jpg"))
        
        rightImageView = UIImageView(frame: CGRect(x: MTAConstants.SREENWITH * 2, y: 0, width: MTAConstants.SREENWITH, height: HeadViewHeight))
        headerScrollView.addSubview(rightImageView!)
        
        rightImageView?.kf.setImage(with: URL(string: "http://img1.hoto.cn/haodou/recipev4/wiki/1d5ff0c46.jpg"))
        
        //分页栏
        if pageControl == nil {
            
            pageControl = UIPageControl()
            pageControl.addTarget(self, action: #selector(pageAction), for: .touchUpInside)
            pageControl.numberOfPages = 3
            headView.addSubview(pageControl)
            
            pageControl.snp.makeConstraints { (make) in
                make.bottom.equalTo(0)
                make.right.equalTo(0)
                
                make.width.equalTo(100)
                make.height.equalTo(40)
                
                
            }
            
        }
        
        
    }
    
    @objc func pageAction() {
        
        headerScrollView.contentOffset = CGPoint(x:MTAConstants.SREENWITH ,y:0)
        index = pageControl.currentPage
        
    }
    
    
    
}
