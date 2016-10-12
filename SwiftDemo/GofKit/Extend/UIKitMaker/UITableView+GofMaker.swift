//
//  UITableView+GofMaker.swift
//  创建TableView
//
//  Created by LeeGof on 16/7/12.
//  Copyright © 2016年 hiko. All rights reserved.
//

import UIKit

extension UITableView
{
    static func gof_tableViewWithDelegate(delegate: UITableViewDelegate? = nil, dataSource:UITableViewDataSource? = nil, superView: UIView? = nil, style: UITableViewStyle = .Plain, constraints: GofConstraintMaker? = nil) -> UITableView
    {
        let tableView = UITableView(frame: CGRectZero, style: style);
        
        tableView.delegate = delegate;
        tableView.dataSource = dataSource;
        tableView.pagingEnabled = false ;
        tableView.separatorStyle = .SingleLine;
        tableView.showsVerticalScrollIndicator = true;
        tableView.showsHorizontalScrollIndicator = false;
        tableView.estimatedRowHeight = 44;
        tableView.rowHeight = UITableViewAutomaticDimension;
        
        if superView != nil
        {
            superView?.addSubview(tableView);
            
            if constraints != nil
            {
                tableView.snp_makeConstraints(closure: { (make) in
                    constraints!(make);
                })
            }
        }
        
        return tableView;
    }
}
