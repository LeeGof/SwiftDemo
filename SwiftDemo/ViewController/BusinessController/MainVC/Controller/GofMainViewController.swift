//
//  GofMainViewController.swift
//  首页
//
//  Created by LeeGof on 16/7/14.
//  Copyright © 2016年 hiko. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class GofMainViewController: GofBaseViewController
{
    // 懒加载
    lazy var arrData: [Int] = {
        var nums = [Int]();

        for i in 0...50
        {
            nums.append(i);
        }
        return nums;
    }();
    
    let cellID = "cell";
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        self.title = "首页";
        
        //定义图片数组
        let imageArray: [String] = ["http://img.taopic.com/uploads/allimg/120517/159413-12051FAA030.jpg", "http://img6.mypsd.com.cn/20111217/Mypsd_67401_201112171024070064B.jpg", "http://tupian.enterdesk.com/2012/1025/gha/1/ebterdesk%20%2810%29.jpg"];
        //声明图片轮播视图
        let scroll = GofImageScrollView.gof_ImageScrollView(imageArray, storeType: .Network, btnClickBlock: { (btn) in
             printLog("Tag:\(btn.tag)");
            }, superView: self.view) { (make) in
                make.top.equalTo(0);
                make.left.right.equalTo(0);
                make.height.equalTo(200);
        }
        
        let tableView = UITableView.gof_tableViewWithDelegate(self, dataSource: self, superView: self.view, style: .Plain) { (make) in
            make.left.right.bottom.equalTo(0);
            make.top.equalTo(scroll.snp_bottom);
        }
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellID);
    }
}

extension GofMainViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrData.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath);
        cell.textLabel!.text = "假数据 - \(arrData[indexPath.row])";
         
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        printLog("点击了\(indexPath.row)");
    }
}
