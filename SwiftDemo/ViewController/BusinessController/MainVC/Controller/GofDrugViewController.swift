//
//  GofDrugViewController.swift
//  药品列表
//
//  Created by LeeGof on 16/7/14.
//  Copyright © 2016年 hiko. All rights reserved.
//

import UIKit
import RxSwift

class GofDrugViewController: GofBaseViewController
{
    let cellID = "cell";
    lazy var arrData: [GofDrugModel] = [];
    var tableView: UITableView?;
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        self.title = "药品列表";
        
        let aa = [1, 2, 3, 4].toObservable();
        
        
        tableView = UITableView.gof_tableViewWithDelegate(self, dataSource: self, superView: self.view, style: .Plain) { (make) in
            make.left.right.top.bottom.equalTo(0);
        }
        tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellID);
        
        GofDrugViewModel.gof_getDrugViewModelWithSuccess { [unowned self] (arrDrugModel) in
            self.arrData = arrDrugModel;
            self.tableView?.reloadData();
        };
    }
}

extension GofDrugViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrData.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = GofDrugCell(style: .Default, reuseIdentifier: cellID);
        
//        if cell == nil
//        {
//            cell = GofDrugCell(style: .Default, reuseIdentifier: cellID);
//        }
        
        cell.gof_configureCell(arrData[indexPath.row]);
//        cell.textLabel!.text = "假数据";
        
        return cell;
    }
    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
//    {
//        let item: AnyObject? = arrData[indexPath.row];
//        
//        return GofDrugCell.gof_cellHeightWithConfig { (cell: UITableViewCell) in
//            cell.gof_configureCell(item!);
//        }
//    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        printLog("点击了\(indexPath.row)");
    }
}