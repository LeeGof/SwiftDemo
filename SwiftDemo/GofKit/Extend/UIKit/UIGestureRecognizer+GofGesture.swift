//
//  UIGestureRecognizer+GofGesture.swift
//  触摸事件扩展
//
//  Created by LeeGof on 16/7/12.
//  Copyright © 2016年 hiko. All rights reserved.
//

import UIKit

var s_GofGestureReconizerBlockKey = "s_GofGestureReconizerBlockKey";

extension UIGestureRecognizer
{
    var gof_gestureBlock: GofGestureBlock? {
        get{
            let gestureBlock = objc_getAssociatedObject(self, &s_GofGestureReconizerBlockKey);
            let dealGestureBlock = unsafeBitCast(gestureBlock, GofGestureBlock.self);
            return dealGestureBlock;
        }
        set(gestureBlock)
        {
            let dealGestureBlock: AnyObject = unsafeBitCast(gestureBlock, AnyObject.self);
            objc_setAssociatedObject(self, &s_GofGestureReconizerBlockKey, dealGestureBlock, .OBJC_ASSOCIATION_COPY);
            
            self.removeTarget(self, action: #selector(onGestureCallback(_:)));
            self.addTarget(self, action: #selector(onGestureCallback(_:)));
        }
    }
    
    func onGestureCallback(gesture: UIGestureRecognizer) -> Void
    {
        let gestureBlock = self.gof_gestureBlock;
        
        if gestureBlock != nil
        {
            gestureBlock!(gesture);
        }
        
    }
}
