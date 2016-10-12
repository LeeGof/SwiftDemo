//
//  GofBaseViewController.swift
//  页面基类
//
//  Created by LeeGof on 16/7/12.
//  Copyright © 2016年 hiko. All rights reserved.
//

import UIKit

class GofBaseViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        self.navigationController?.interactivePopGestureRecognizer?.enabled = false;
        self.extendedLayoutIncludesOpaqueBars = false;
        self.edgesForExtendedLayout = .None;
        self.modalPresentationCapturesStatusBarAppearance = false;
        
        view.backgroundColor = .whiteColor();
    }
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated);
        printLog("当前控制器类名称：\(self.description)");
    }
    
    deinit
    {
        
        printLog("控制器已释放：\(self.description)");
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning();
    }
}
