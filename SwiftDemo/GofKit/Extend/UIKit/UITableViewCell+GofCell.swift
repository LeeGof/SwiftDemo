//
//  UITableViewCell+GofCell.swift
//  表格行--计算行高
//
//  Created by LeeGof on 16/8/1.
//  Copyright © 2016年 hiko. All rights reserved.
//

import UIKit

var s_BottomViewInCell = "s_BottomViewInCell";
var s_BottomOffsetToCell = "s_BottomOffsetToCell";

/// 表格行参数的闭包
typealias GofTableViewCellBlock = (UITableViewCell) -> Void;

extension UITableViewCell
{
    /// 表格行最下面视图
    var gof_bottomViewInCell: UIView? {
        get {
            return objc_getAssociatedObject(self, &s_BottomViewInCell) as? UIView;
        }
        set {
            objc_setAssociatedObject(self, &s_BottomViewInCell, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    /// 指定的bottomViewInCell到cell的底部的距离
    var gof_bottomOffsetToCell: CGFloat? {
        get {
            let valueObject = objc_getAssociatedObject(self, &s_BottomOffsetToCell);
            if let floatValue = valueObject as? CGFloat
            {
                return floatValue;
            }
            else
            {
                return 0.0;
            }
        }
        set {
            objc_setAssociatedObject(self, &s_BottomOffsetToCell, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    /**
     计算行高，需要在config中调用配置数据的API
     
     - parameter config: 必须要实现，且需要调用配置数据的API
     */
    static func gof_cellHeightWithConfig(config: GofTableViewCellBlock) -> CGFloat
    {
        let cell = self.init(style: . Default, reuseIdentifier: nil);
        
        config(cell);
        
        return cell.gof_heightForIndexPath();
    }
    
    /**
     私有方法
     
     - returns: 计算行高
     */
    private func gof_heightForIndexPath() -> CGFloat
    {
        if gof_bottomViewInCell != nil
        {
            var rowHeight = gof_bottomViewInCell!.frame.size.height + gof_bottomViewInCell!.frame.origin.y;
            rowHeight += gof_bottomOffsetToCell!;
            
            return rowHeight;
        }
        return 0.0;
    }
    
    /**
     配置表格行
     
     - parameter obj: 表格行数据
     */
    func gof_configureCell(dataObj: AnyObject)
    {
        //需要重写该方法来配置表格数据
    }
}
