//
//  MTAMyViewController.swift
//  MenuTiny
//
//  Created by caihongguang on 2018/5/22.
//  Copyright © 2018年 SYJ. All rights reserved.
//

import UIKit

private let kHeadViewHeight:CGFloat = 200

private let ct01Array = [["title":"豆友", "image":"HPHBIcon"],["title":"驴友", "image":"HPHBIcon"],["title":"驴6友", "image":"HPHBIcon"],["title":"驴7友", "image":"HPHBIcon"]]


class MTAMyViewController: MTABaseViewController,UITableViewDataSource,UITableViewDelegate {
    
    var headerBg: UIImageView? = nil
    var headerIcon: UIImageView? = nil
    
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
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func setupUI(){
        
        createHeaderView()
        createtableView()
    }
    
    func createtableView(){
        
        
        self.tableView = UITableView(frame: self.view.bounds, style: .plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cellId")
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
        headerBg?.contentMode = .scaleToFill
        //头像
        headerIcon = UIImageView()
        headerIcon?.layer.cornerRadius =  MTAConstants.SREENWITH / 8
        headerIcon?.clipsToBounds = true
        headerIcon?.image = UIImage(named: "noDataDefaultIcon")
        headerBg?.addSubview(headerIcon!)
        
        headerIcon?.snp.makeConstraints({ (make) in
            make.width.equalTo(MTAConstants.SREENWITH / 4)
            make.height.equalTo(MTAConstants.SREENWITH / 4)
            make.top.equalTo(self.headerBg!).offset(80)
            make.left.equalTo(self.headerBg!).offset(MTAConstants.SREENWITH / 2 - MTAConstants.SREENWITH/8)
            
        })
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ct01Array.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //判断用户是否登录
        let defults = UserDefaults.standard
        let authToken = defults.object(forKey: MTAConstants.AuthToken)
        
        
        if authToken == nil {
            
            self.navigationController?.pushViewController(MTALoginViewController(), animated: true)
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        cell.accessoryType = UITableViewCellAccessoryType.none
        
        var iconImageView:UIImageView?  = cell.viewWithTag(1000) as? UIImageView
        if iconImageView == nil {
            
            iconImageView = UIImageView()
            
            iconImageView?.tag = 1000
            
            cell.contentView.addSubview(iconImageView!)
            
            iconImageView?.snp.makeConstraints({ (make) in
                
                make.width.equalTo(20)
                make.height.equalTo(20)
                make.left.equalTo(cell.contentView).offset(16)
                make.top.equalTo(cell.contentView).offset(12)
                
            })
            
        }
        
        
        
        var titleName:UILabel?  = cell.viewWithTag(1001) as? UILabel
        if titleName == nil {
            
            titleName = UILabel()
            
            titleName?.tag = 1001
            
            cell.contentView.addSubview(titleName!)
            titleName?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            //            titleName?.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            titleName?.snp.makeConstraints({ (make) in
                
                make.width.equalTo(90)
                make.height.equalTo(30)
                make.left.equalTo(iconImageView!).offset(36)
                make.top.equalTo(cell.contentView).offset(10)
                
            })
            
            
            
        }
        
        let dic = ct01Array[indexPath.section]
        let imageNameStr = dic["image"]
        iconImageView?.image = UIImage(named: imageNameStr!)
        titleName?.text = dic["title"]
        titleName?.sizeToFit()
        
        return cell
        
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
            headerIcon?.snp.updateConstraints({ (make) in
                
                make.left.equalTo(((rect?.width)! - 80) / 2 )
                
            })
            
            
            
            
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
