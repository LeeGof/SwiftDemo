//
//  GofTabBarController.swift
//  SwiftDemo
//
//  Created by LeeGof on 16/7/14.
//  Copyright © 2016年 hiko. All rights reserved.
//

import UIKit

class GofTabBarController: UITabBarController
{
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
//        self.edgesForExtendedLayout = .None;
//        self.extendedLayoutIncludesOpaqueBars = false;
//        self.automaticallyAdjustsScrollViewInsets = false;
        
        addTabBarChildViewController(GofMainViewController(), title: "首页", imageName: "tab_home", selectedImageName: "tab_home_sel", tag: 0);
        addTabBarChildViewController(GofDrugViewController(), title: "药品列表", imageName: "tab_drug", selectedImageName: "tab_drug_sel", tag: 1);
        addTabBarChildViewController(GofShopcartViewController(), title: "购物车", imageName: "tab_shopcart", selectedImageName: "tab_shopcart_sel", tag: 2);
        addTabBarChildViewController(GofMyViewController(), title: "我的", imageName: "tab_my", selectedImageName: "tab_my_sel", tag: 3);
    }
    
    private func addTabBarChildViewController(childVC: UIViewController, title: String, imageName: String, selectedImageName: String, tag: Int)
    {
        let vcItem = UITabBarItem(title: title, image: gof_ImageWithName(imageName), selectedImage: gof_ImageWithName(selectedImageName)?.imageWithRenderingMode(.AlwaysOriginal));
        vcItem.tag = tag;
        childVC.tabBarItem = vcItem;
        
        let navigationVC = GofNavigationController(rootViewController: childVC);
        addChildViewController(navigationVC);
    }
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem)
    {
        printLog("didSelectIndex:\(item.tag)");
    }
}
