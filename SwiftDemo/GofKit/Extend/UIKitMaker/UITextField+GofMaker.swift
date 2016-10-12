//
//  UITextField+GofMaker.swift
//  创建UITextField
//
//  Created by LeeGof on 16/7/13.
//  Copyright © 2016年 hiko. All rights reserved.
//

import UIKit

extension UITextField
{
    /**
     创建TextField
     
     - parameter text:        内容
     - parameter placeholder: placeholder
     - parameter isSecurity:  是否加密
     - parameter delegate:    委托
     - parameter superView:   父视图
     - parameter constraints: 约束
     
     - returns: TextField
     */
    static func gof_textFieldWithText(text: String? = nil, placeholder: String? = nil, isSecurity: Bool? = nil, delegate: UITextFieldDelegate? = nil, superView: UIView? = nil, constraints: GofConstraintMaker? = nil) -> UITextField
    {
        let textField = UITextField();
        if text != nil
        {
            textField.text = text;
        }
        textField.textColor = kBColor;
        textField.font = kBodyFont;
        textField.clipsToBounds = true;
        textField.layer.masksToBounds = true;
        textField.textAlignment = .Left;
        if placeholder != nil
        {
            textField.placeholder = placeholder;
        }
        if delegate != nil
        {
            textField.delegate = delegate;
        }
        if isSecurity != nil
        {
            textField.secureTextEntry = isSecurity!;
        }
        
        textField.borderStyle = .None;
        textField.contentVerticalAlignment = .Center;
        
        if superView != nil
        {
            superView?.addSubview(textField);
            
            if constraints != nil
            {
                textField.snp_makeConstraints(closure: { (make) in
                    constraints!(make);
                })
            }
        }
        
        return textField;
    }
}
