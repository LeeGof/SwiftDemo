//
//  UIView+GofMaker.swift
//  SwiftDemo
//
//  Created by LeeGof on 16/8/1.
//  Copyright © 2016年 hiko. All rights reserved.
//

import UIKit

extension UIView
{
    /**
     创建视图
     
     - parameter bgColor:     背景颜色
     - parameter superView:   父视图
     - parameter constraints: 约束
     */
    static func gof_viewWithBgColor(bgColor: UIColor? = kCColor, superView: UIView? = nil, constraints: GofConstraintMaker? = nil)
    {
        let view = UIView();
        
        view.backgroundColor = bgColor;
        
        if superView != nil
        {
            superView?.addSubview(view);
            
            if constraints != nil
            {
                view.snp_makeConstraints(closure: { (make) in
                    constraints!(make);
                })
            }
        }
    }
}
