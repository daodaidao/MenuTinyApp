//
//  MTARankingViewController.swift
//  MenuTiny
//
//  Created by caihongguang on 2018/5/23.
//  Copyright © 2018年 SYJ. All rights reserved.
//

import UIKit

class MTARankingViewController: MTABaseViewController,UITableViewDataSource,UITableViewDelegate {

    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        
        //数据加载建立单独拿个demo 做
//        doGetRequestData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "排行榜"
        
        self.navigationItem.leftBarButtonItem = CoreUtils.HDBackBarButtonItem(#selector(backAction), taget: self)
        
        
    }
    
    //数据加载
    func doGetRequestData(){
        
        unowned let WS =  self
        
        self.showHud()
        
        
        
    }
    
    
    
    func setupUI(){
        
        self.view.backgroundColor = MTAConstants.HDBGViewColor
        
        CoreUtils.showProgressHUD(self.view)
        //gcd延迟调用
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2) {
            CoreUtils.hidProgressHUD(self.view)
        }
        
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.tableFooterView = UIView()
//        tableView.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = "测试"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        self.hidesBottomBarWhenPushed = true

        navigationController?.pushViewController(MTAM08ViewController(), animated: true)
  
         self.hidesBottomBarWhenPushed = false
    }
    
    deinit {
        print("rankingVC deinit")
    }

   

}
