//
//  GofShopcartViewController.swift
//  购物车
//
//  Created by LeeGof on 16/7/14.
//  Copyright © 2016年 hiko. All rights reserved.
//

import UIKit

class GofShopcartViewController: GofBaseViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        self.title = "购物车";
        
        //完整参数调用
        let label1 = UILabel.gof_labelWithText("完整调用", textColor: gof_ColorWithHex(0xff0000), font: kBodyFont, superView: self.view) { (make) in
            make.left.top.equalTo(10);
            make.right.equalTo(-10);
            make.height.equalTo(30);
        }
        
        //没有字体颜色参数
        let label2 = UILabel.gof_labelWithText("没有字体颜色", font: kNavFont, superView: self.view) { (make) in
            make.left.equalTo(10);
            make.right.equalTo(-10);
            make.top.equalTo(label1.snp_bottom).offset(10);
            make.height.equalTo(30);
        }
        
        //没有字体参数
        UILabel.gof_labelWithText("没有字体", textColor: gof_ColorWithHex(0x0000ff), superView: self.view) { (make) in
            make.left.equalTo(10);
            make.right.equalTo(-10);
            make.top.equalTo(label2.snp_bottom).offset(10);
            make.height.equalTo(30);
        }
    }
}
