//
//  GofTableViewManger.swift
//  表格协议处理类
//
//  Created by LeeGof on 16/7/29.
//  Copyright © 2016年 hiko. All rights reserved.
//

import UIKit

/// 表格行单击回调Block
typealias didSelectTableCellBlock = (NSIndexPath, AnyObject) -> Void;

class GofTableViewManger<CellClassType: UITableViewCell>: NSObject, UITableViewDelegate, UITableViewDataSource
{
    var cellIdentifiers = String();
    lazy var arrData = [];
    var didSelectCellBlock: didSelectTableCellBlock?
    
    /**
     构造函数
     
     - parameter cellIdentifiers: cellIdentifiers
     - parameter didSelectBlock:  表格行单击回调Block
     
     - returns: self
     */
    init(cellIdentifier: String = "cellIdentifier", didSelectBlock: didSelectTableCellBlock)
    {
        cellIdentifiers = cellIdentifier;
        didSelectCellBlock = didSelectBlock;
    }
    
    /**
     设置代理
     
     - parameter table: 表格
     */
    func handleTableViewDatasourceAndDelegate(table: UITableView)
    {
        table.dataSource = self;
        table.delegate   = self;
    }
    
    /**
     获取表格数据
     
     - parameter modelArray: 返回模型数组
     - parameter completion: 获取数据完成时回调Block
     */
    func getItemsWithModelArray(modelArray: [AnyObject]?, completion: GofVoidBlock?) -> Void
    {
        if let _ = modelArray
        {
            arrData = modelArray!;
            if let _ = completion
            {
                completion!();
            }
        }
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrData.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifiers);
//        if cell == nil
//        {
//            cell = CellClassType(style: .Default, reuseIdentifier:cellIdentifiers);
//        }
        
        let item: AnyObject? = arrData[indexPath.row];
        cell?.gof_configureCell(item!);
        
        return cell!
    }
    
    // MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        let item: AnyObject? = arrData[indexPath.row];
        
        return CellClassType.gof_cellHeightWithConfig { (cell: UITableViewCell) in
            cell.gof_configureCell(item!);
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let item: AnyObject? = arrData[indexPath.row];
        self.didSelectCellBlock?(indexPath, item!);
    }
}