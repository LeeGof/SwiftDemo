//
//  UITableView+GofTableDelegate.swift
//  SwiftDemo
//
//  Created by LeeGof on 16/8/1.
//  Copyright © 2016年 hiko. All rights reserved.
//

import UIKit

var s_GofTableViewManger = "s_GofTableViewManger";

extension UITableView
{
    var tableHander: GofTableViewManger<UITableViewCell> {
        get {
            return objc_getAssociatedObject(self, &s_GofTableViewManger) as! GofTableViewManger
        }
        set {
            newValue.handleTableViewDatasourceAndDelegate(self);
            objc_setAssociatedObject(self, &s_GofTableViewManger, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}