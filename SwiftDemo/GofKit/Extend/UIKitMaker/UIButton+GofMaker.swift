//
//  UIButton+GofButtonMaker.swift
//  创建UIButton
//
//  Created by LeeGof on 16/7/12.
//  Copyright © 2016年 hiko. All rights reserved.
//

import UIKit

extension UIButton
{
    /**
     创建UIButton控件
     
     - parameter title:           按钮标题
     - parameter cornerRadius:    圆角
     - parameter backgroundColor: 背景颜色
     - parameter backgroundImage: 背景图片
     - parameter superView:       父视图
     - parameter constraints:     约束
     - parameter touchup:         点击事件
     
     - returns: UIButton控件
     */
    static func gof_buttonWithTitle(title: String? = nil, cornerRadius: CGFloat? = nil, backgroundColor: UIColor? = nil, backgroundImage: String? = nil, superView: UIView? = nil, constraints: GofConstraintMaker? = nil, touchup: GofBtnClickBlock? = nil) -> UIButton
    {
        let button = UIButton(type: .Custom);
        if title != nil
        {
            button.setTitle(title, forState: .Normal);
            button.titleLabel?.font = kTitleFont;
        }
        
        if backgroundColor != nil
        {
            button.backgroundColor = backgroundColor;
        }
        else
        {
            button.backgroundColor = kCColor;
        }
        
        if backgroundImage != nil
        {
            button.setBackgroundImage(gof_ImageWithName(backgroundImage!), forState: .Normal);
        }
        
        if cornerRadius != nil
        {
            button.layer.cornerRadius = cornerRadius!;
            button.layer.masksToBounds = true;
        }
        
        if superView != nil
        {
            superView!.addSubview(button);
            
            if constraints != nil
            {
                button.snp_makeConstraints(closure: { (make) in
                    constraints!(make);
                })
            }
        }
        
        if touchup != nil
        {
            button.gof_touchUpInside = touchup!;
        }
        
        return button;
    }
    
    /**
     创建UIButton控件
     
     - parameter normalImageName:      Normal状态图片名称
     - parameter highLightedImageName: Highlighted状态图片名称
     - parameter superView:            按钮父视图
     - parameter constraints:          按钮约束
     - parameter touchup:              按钮点击事件
     
     - returns: UIButton控件
     */
    static func gof_buttonWithImage(normalImageName: String?, highLightedImageName: String?, superView: UIView?, constraints: GofConstraintMaker?, touchup: GofBtnClickBlock?) -> UIButton
    {
        let button = self.gof_buttonWithTitle(nil, superView: superView, constraints: constraints, touchup: touchup);
        
        if normalImageName != nil
        {
            button.setImage(gof_ImageWithName(normalImageName!), forState: .Normal);
        }
        
        if highLightedImageName != nil
        {
            button.setImage(gof_ImageWithName(highLightedImageName!), forState: .Highlighted);
        }
        
        return button;
    }
}