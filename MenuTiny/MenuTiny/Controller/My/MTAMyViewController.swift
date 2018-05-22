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
    

}
