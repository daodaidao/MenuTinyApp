//
//  MTAMyViewController.swift
//  MenuTiny
//
//  Created by caihongguang on 2018/5/22.
//  Copyright © 2018年 SYJ. All rights reserved.
//

import UIKit

private let kHeadViewHeight:CGFloat = 200

class MTAMyViewController: MTABaseViewController,UITableViewDataSource,UITableViewDelegate {

    var headerBg: UIImageView? = nil
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.edgesForExtendedLayout = UIRectEdge()
//        self.extendedLayoutIncludesOpaqueBars = false

//        self.modalPresentationCapturesStatusBarAppearance = false
//        self.automaticallyAdjustsScrollViewInsets = true;

        
        setupUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    func setupUI(){
        
        createHeaderView()
        createtableView()
    }
    
    func createtableView(){
        
        
        self.tableView = UITableView(frame: self.view.bounds, style: .plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        
        self.tableView.contentInset = UIEdgeInsetsMake(kHeadViewHeight, 0, 0, 0)
        self.tableView.addSubview(headerBg!)
        //兼容IOS11 防止把状态栏空白出去
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.never;
        }
    }
    
    func createHeaderView(){
        
        //背景图
        headerBg = UIImageView(frame: CGRect(x: 0, y: -kHeadViewHeight, width: MTAConstants.SREENWITH, height: kHeadViewHeight))
        headerBg?.image = UIImage(named: "guide_step03")
        
        
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableViewCell = UITableViewCell()
        
        return tableViewCell
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let yOffset = scrollView.contentOffset.y
        print("yOffset:\(yOffset)")
        let xOffset = (yOffset + kHeadViewHeight) / 2
        
        
        
        if yOffset < -kHeadViewHeight{
            //获取背景坐标及大小
            var rect = headerBg?.frame
            //frame的值就是一个CGRect 包括（originX，originY，width，height）。
//            originX和originY对应着该对象在其superview中的坐标，也就是说他是一个相对坐标。
            rect?.origin.y = yOffset
            rect?.size.height = -yOffset
            rect?.origin.x = xOffset
            rect?.size.width = MTAConstants.SREENWITH + fabs(xOffset) * 2
            
            headerBg?.frame = rect!
//            headerIcon?.snp.updateConstraints({ (make) in
//
//                make.left.equalTo(((rect?.width)! - 80) / 2 )
 
//            })
            
            
            
            
        }
        
        if yOffset > -kHeadViewHeight {
            
            
            
//            if yOffset > -kHeadViewHeight {
//
//                //上拉
//                var ap = 1 - fabs(yOffset + 100) / CGFloat(100)
//
//                if ap > 1 {
//
//                    ap = 1
//
//                }
//
//
//
//            }
            
        }
        
        
        
    }
    

}
