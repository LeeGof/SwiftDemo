//
//  GofDrugCell.swift
//  SwiftDemo
//
//  Created by LeeGof on 16/8/1.
//  Copyright © 2016年 hiko. All rights reserved.
//

import UIKit

class GofDrugCell: UITableViewCell
{
    var lblTitle: UILabel?;
    var lblSub: UILabel?;
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        lblTitle = UILabel.gof_labelWithText("iOS依赖库管理工具之Carthage", superView: self.contentView) { (make) in
            make.left.equalTo(10);
            make.right.equalTo(-10);
            make.top.equalTo(10);
            make.height.equalTo(20);
        };
        
        lblSub = UILabel.gof_labelWithText("在iOS开发中，我们常会用CocoaPods来进行依赖库的管理。CoaoaPods 是一套整体解决方案，我们在 Podfile 中指定好我们需要的第三方库，然后 CocoaPods 就会进行下载，集成，然后修改或者创建我们项目的 workspace 文件。", font: kAssistFont, superView: self.contentView) { (make) in
            make.top.equalTo(self.lblTitle!.snp_bottom).offset(5);
            make.left.equalTo(10);
            make.right.equalTo(-10);
            make.bottom.equalTo(-10);
        }
        lblSub!.numberOfLines = 0;
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!;
    }
    
    override func gof_configureCell(dataObj: AnyObject)
    {
        if let model = dataObj as? GofDrugModel {
            lblSub?.text = model.title;
        }
        lblTitle?.text = "iOS依赖库管理工具之Carthage";
        
    }
}
