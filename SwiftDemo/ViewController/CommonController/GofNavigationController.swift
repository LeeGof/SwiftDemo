//
//  GofNavigationController.swift
//  自定义的导航栏
//
//  Created by LeeGof on 16/7/13.
//  Copyright © 2016年 hiko. All rights reserved.
//

import UIKit

class GofNavigationController: UINavigationController
{
    /// 是否显示动画
    var isShowAnimation = true;
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        interactivePopGestureRecognizer!.delegate = nil;
    }
    
    /// 返回按钮
    lazy var backBtn: UIButton = {
        let backBtn = UIButton(type: UIButtonType.Custom);
        backBtn.setImage(gof_ImageWithName("nav_back"), forState: .Normal);
        backBtn.titleLabel?.hidden = true;
        backBtn.addTarget(self, action: #selector(backClick), forControlEvents: .TouchUpInside);
        backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left;
        backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        backBtn.frame = CGRectMake(0, 0, 44, 40);
        
        return backBtn;
    }();
    
    override func pushViewController(viewController: UIViewController, animated: Bool)
    {
        viewController.navigationItem.hidesBackButton = true;
        if childViewControllers.count > 0
        {
            UINavigationBar.appearance().backItem?.hidesBackButton = false;
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn);
            viewController.hidesBottomBarWhenPushed = true;
        }
        
        super.pushViewController(viewController, animated: animated);
    }
    
    func backClick()
    {
        popViewControllerAnimated(isShowAnimation);
    }
}
