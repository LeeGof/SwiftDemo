//
//  UILabel+GofLabelMaker.swift
//  创建UILabel
//
//  Created by LeeGof on 16/7/12.
//  Copyright © 2016年 hiko. All rights reserved.
//

import UIKit

extension UILabel
{
    /**
     创建UILabel
     
     - parameter text:        标题
     - parameter textColor:   标题颜色
     - parameter font:        标题字体
     - parameter superView:   父视图
     - parameter constraints: 约束
     
     - returns: UILabel
     */
    static func gof_labelWithText(text: String? = nil, textColor:UIColor? = nil, font: UIFont? = nil, superView: UIView? = nil, constraints: GofConstraintMaker? = nil) -> UILabel
    {
        let label = UILabel();
        label.backgroundColor = kCColor;
        label.text = text ?? "";
        label.textColor = textColor ?? kBColor;
        label.font = font ?? kBodyFont;
        label.textAlignment = .Left;
        label.numberOfLines = 1;
        
        if superView != nil
        {
            superView?.addSubview(label);
            
            if constraints != nil
            {
                label.snp_makeConstraints(closure: { (make) in
                    constraints!(make);
                })
            }
        }
        
        return label;
    }
}
