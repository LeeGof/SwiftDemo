//
//  GofLoginViewController.swift
//  SwiftDemo
//
//  Created by LeeGof on 16/7/13.
//  Copyright © 2016年 hiko. All rights reserved.
//

import UIKit

class GofLoginViewController: GofBaseViewController
{
    /// 登录名输入框
    private var tfLoginName: UITextField?;
    /// 登录密码输入框
    private var tfLoginPwd: UITextField?;
    /// 登录按钮
    private var btnLogin: UIButton?;
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        self.title = "登录";
        
        /// 输入框背景
        let ivBg = UIImageView.gof_imageViewWithImage("input_bg", superView: self.view) { (make) in
            make.width.equalTo(290);
            make.height.equalTo(82);
            make.top.equalTo(100);
            make.centerX.equalTo(self.view);
        };
        ivBg.userInteractionEnabled = true;
        
        /// 登录名ICON
        let ivIconName = UIImageView.gof_imageViewWithImage("icon_account", superView: ivBg) { (make) in
            make.width.equalTo(15);
            make.height.equalTo(19);
            make.left.equalTo(10);
            make.top.equalTo(11);
        }
        
        /// 登录名输入框
        tfLoginName = UITextField.gof_textFieldWithText("用户名", superView: ivBg, constraints: { (make) in
            make.left.equalTo(ivIconName.snp_right).offset(15);
            make.right.equalTo(-10);
            make.height.equalTo(20);
            make.centerY.equalTo(ivIconName);
        })
        tfLoginName?.text = GofUserSession.shareInstance.userLoginName ?? "";
        
        /// 密码ICON
        let ivIconPwd = UIImageView.gof_imageViewWithImage("icon_secret", superView: ivBg) { (make) in
            make.width.equalTo(17);
            make.height.equalTo(19);
            make.left.equalTo(10);
            make.top.equalTo(52);
        }
        
        /// 登录密码输入框
        tfLoginPwd = UITextField.gof_textFieldWithText(nil, placeholder: "密码", isSecurity: true, delegate: nil, superView: ivBg, constraints: { (make) in
            make.left.equalTo(self.tfLoginName!.snp_left);
            make.right.equalTo(self.tfLoginName!.snp_right);
            make.top.equalTo(ivIconPwd.snp_top);
            make.height.equalTo(20);
        });
        tfLoginPwd?.text = GofUserSession.shareInstance.userLoginPwd ?? "";
        
        /// 登录按钮
        btnLogin = UIButton.gof_buttonWithTitle("登录", cornerRadius: 3.0, backgroundColor: kEssentialColor, superView: self.view, constraints: { (make) in
            make.left.equalTo(ivBg.snp_left);
            make.right.equalTo(ivBg.snp_right);
            make.height.equalTo(40);
            make.top.equalTo(ivBg.snp_bottom).offset(30);
            }, touchup: { [unowned self] (btn) in
                if self.tfLoginName?.text != nil && self.tfLoginPwd?.text != nil
                {
                    GofUserSession.shareInstance.userLoginName = self.tfLoginName?.text;
                    GofUserSession.shareInstance.userLoginPwd = self.tfLoginPwd?.text
                    GofLoginHelper.loginToMainVC();
                }
        })
    }
    
}
