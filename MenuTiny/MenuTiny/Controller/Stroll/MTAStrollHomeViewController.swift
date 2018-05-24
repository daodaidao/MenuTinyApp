//
//  MTAStrollHomeViewController.swift
//  MenuTiny
//
//  Created by caihongguang on 2018/5/23.
//  Copyright © 2018年 SYJ. All rights reserved.
//

import UIKit



class MTAStrollHomeViewController: MTABaseViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        createTableView()
        
        
    }

    func createTableView() {
        
        
            
 
            tableView.tableFooterView = UIView()
            tableView.delegate = self
            tableView.dataSource = self
            tableView.backgroundColor = UIColor.red
            tableView.separatorStyle = UITableViewCellSeparatorStyle.none
//            self.tableView.isHidden = true
            self.view.addSubview(self.tableView)
            tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "myCell")
            tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "mycell2")
            unowned let WS = self
            tableView.snp.makeConstraints( { (make) -> Void in
                
                make.top.equalTo(WS.view).offset(0)
                make.left.equalTo(WS.view).offset(0)
                make.bottom.equalTo(WS.view).offset(0)
                make.right.equalTo(WS.view).offset(0)
                
            })
        
 
        tableView.mj_header = SYJRefreshGifHeader(refreshingBlock: { () -> Void in

            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
                
                self.tableView.mj_header.endRefreshing()
                
            })

        })
      
        tableView.mj_footer = SYJRefreshGifFooter(refreshingBlock: { () -> Void in
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
                
                self.tableView.mj_footer.endRefreshing()
                
            })
            
        })
        
     
        
    }
    
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "yigere"
        return cell
    }

}
