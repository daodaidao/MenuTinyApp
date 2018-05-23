//
//  MTALoginViewController.swift
//  MenuTiny
//
//  Created by caihongguang on 2018/5/23.
//  Copyright © 2018年 SYJ. All rights reserved.
//

import UIKit

class MTALoginViewController: UITableViewController {
    
    var username: UITextField!
    var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "登录"
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        self.navigationItem.leftBarButtonItem = CoreUtils.HDBackBarButtonItem(#selector(backAction), taget: self)
        
        
        
    }
    
    @objc func backAction(){
        navigationController?.popViewController(animated: true)
    }
    
    
    func setupUI() {
        
        self.view.backgroundColor = MTAConstants.HDBGViewColor
        
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "loginCell")
        self.tableView.tableFooterView = UIView()
        
        self.tableView.separatorStyle = .none
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if (indexPath as NSIndexPath).row == 0 {
            
            return 60
        } else if (indexPath as NSIndexPath).row == 1 {
            
            return 50
        } else {
            
            return 140
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "loginCell", for: indexPath)
        
        
        if(indexPath as NSIndexPath).row == 0 {
            
            let bg = UILabel()
            cell.contentView.addSubview(bg)
            bg.backgroundColor = MTAConstants.HDBGViewColor
            bg.snp.makeConstraints { (make) in
                make.left.equalTo(cell.contentView).offset(0)
                make.top.equalTo(cell.contentView).offset(0)
                make.width.equalTo(MTAConstants.SREENWITH)
                make.height.equalTo(10)
            }
            
            let title = UILabel()
            title.text = "账号:"
            title.font = UIFont.systemFont(ofSize: 16)
            title.textColor = MTAConstants.HDMainTextColor
            cell.contentView.addSubview(title)
            title.snp.makeConstraints { (make) in
                make.width.equalTo(50)
                make.height.equalTo(50)
                make.left.equalTo(16)
                make.top.equalTo(16)
            }
            
            username = UITextField()
            username.text = "6666"
            username.placeholder = "请输入邮箱或手机号"
            username.font = UIFont.systemFont(ofSize: 16)
            cell.contentView.addSubview(username)
            
            username.snp.makeConstraints { (make) in
                make.left.equalTo(title.snp.right).offset(0)
                make.top.equalTo(cell.contentView).offset(20)
                make.height.equalTo(40)
                make.width.equalTo(MTAConstants.SREENWITH - 80)
            }
            
            
            
            
            
        }
        else    if(indexPath as NSIndexPath).row == 1 {
            
            let title = UILabel()
            title.text = "密码:"
            title.font = UIFont.systemFont(ofSize: 16)
            title.textColor = MTAConstants.HDMainTextColor
            cell.contentView.addSubview(title)
            title.snp.makeConstraints { (make) in
                make.width.equalTo(50)
                make.height.equalTo(50)
                make.left.equalTo(16)
                make.top.equalTo(16)
            }
            
            password = UITextField()
            password.placeholder = "密码不小于6位数"
            password.isSecureTextEntry = true
            cell.contentView.addSubview(password)
            password.snp.makeConstraints{ (make) in
                
                make.width.equalTo(MTAConstants.SREENWITH - 80)
                make.top.equalTo(cell.contentView).offset(15)
                make.height.equalTo(40)
                make.left.equalTo(title.snp.right).offset(6)
            }
            
            
            
        }
        else {
            let forgetBtn = UIButton(type: .custom)
            
            forgetBtn.setTitle("忘记密码?", for: UIControlState())
            forgetBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            forgetBtn.setTitleColor(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), for: UIControlState())
            forgetBtn.addTarget(self, action: #selector(forgetAction), for: .touchUpInside)
            
            cell.contentView.addSubview(forgetBtn)
            
            forgetBtn.snp.makeConstraints { (make) in
                make.width.equalTo(80)
                make.height.equalTo(40)
                make.left.equalTo(cell.contentView).offset(10)
                make.top.equalTo(cell.contentView).offset(20)
                
            }
            
            
            
            
            
        }
        
        return cell
    }
    
    @objc func forgetAction (){
        
        CoreUtils.showSuccessHUD(self.view, title: "忘记密码功能没开通！")
        
    }
    
    
}
