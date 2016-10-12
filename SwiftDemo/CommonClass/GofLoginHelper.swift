//
//  GofLoginHelper.swift
//  SwiftDemo
//
//  Created by LeeGof on 16/7/13.
//  Copyright © 2016年 hiko. All rights reserved.
//

import Foundation
import UIKit

class GofLoginHelper
{
    /// 用户是否登录
    static var isLogin: Bool {
//        printLog("\(GofUserSession().userLoginName)");
        if GofUserSession.shareInstance.userLoginName != nil && GofUserSession.shareInstance.userLoginPwd != nil
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    
    static func loginToMainVC()
    {
        let vc = GofTabBarController();        
        AppDelegate().appDelegate!.window?.rootViewController = vc;
    }
}

