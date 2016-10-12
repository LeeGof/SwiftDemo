//
//  UIControl+GofControl.swift
//  点击事件扩展
//
//  Created by LeeGof on 16/7/12.
//  Copyright © 2016年 hiko. All rights reserved.
//

import UIKit

var s_GofButtonTouchDownKey = "s_GofButtonTouchDownKey";
var s_GofButtonTouchUpKey = "s_GofButtonTouchUpKey";

extension UIControl
{
    /// 按钮TouchDown
    var gof_touchDown: GofBtnClickBlock? {
        get{
            let touchDown = objc_getAssociatedObject(self, &s_GofButtonTouchDownKey);
            let dealTouchDown = unsafeBitCast(touchDown, GofBtnClickBlock.self);
            return dealTouchDown;
        }
        set(touchDown)
        {
            let dealTouchDown: AnyObject = unsafeBitCast(touchDown, AnyObject.self);
            objc_setAssociatedObject(self, &s_GofButtonTouchDownKey, dealTouchDown, .OBJC_ASSOCIATION_COPY);
            
            self.removeTarget(self, action: #selector(onTouchDown(_:)), forControlEvents: .TouchDown);
            self.addTarget(self, action: #selector(onTouchDown(_:)), forControlEvents: .TouchDown)
        }
    }
    
    /// 按钮TouchUpInside
    var gof_touchUpInside: GofBtnClickBlock? {
        get{
            let touchUp = objc_getAssociatedObject(self, &s_GofButtonTouchUpKey);
            let dealTouchUp = unsafeBitCast(touchUp, GofBtnClickBlock.self);
            return dealTouchUp;
        }
        set(touchUp)
        {
            let dealTouchUp: AnyObject = unsafeBitCast(touchUp, AnyObject.self);
            objc_setAssociatedObject(self, &s_GofButtonTouchUpKey, dealTouchUp, .OBJC_ASSOCIATION_COPY);
            
            self.removeTarget(self, action: #selector(onTouchUp(_:)), forControlEvents: .TouchUpInside);
            self.addTarget(self, action: #selector(onTouchUp(_:)), forControlEvents: .TouchUpInside)
        }
    }
    
    /**
     按钮TouchDown事件处理
     
     - parameter btn: 按钮
     */
    func onTouchDown(btn: UIButton) -> Void
    {
        let touchDown = self.gof_touchDown;

        if touchDown != nil
        {
            touchDown!(btn);
        }
        
    }
    
    /**
     按钮TouchUpInside事件处理
     
     - parameter btn: 按钮
     */
    func onTouchUp(btn: UIButton) -> Void
    {
        let touchUp = self.gof_touchUpInside;
        
        if touchUp != nil
        {
            touchUp!(btn);
        }
    }
}