//
//  GofUserSession.swift
//  用户信息缓存类(单例)
//
//  Created by LeeGof on 16/7/13.
//  Copyright © 2016年 hiko. All rights reserved.
//

import Foundation

var kLastLoginNameKey = "kLastLoginNameKey";
var kLastLoginPwdKey = "kLastLoginPwdKey";

class GofUserSession
{
    static let shareInstance = GofUserSession();
    
    private init() {}
    
    /// 用户登录名
    var userLoginName: String? {
        get {
            return NSUserDefaults.standardUserDefaults().stringForKey(kLastLoginNameKey);
        }
        set {
            if newValue != nil
            {
                NSUserDefaults.standardUserDefaults().gof_safeSetValue(newValue, key: kLastLoginNameKey);
            }
            else
            {
                NSUserDefaults.standardUserDefaults().removeObjectForKey(kLastLoginNameKey);
            }
        }
    }
    
    /// 用户登录密码
    var userLoginPwd: String? {
        get {
            return NSUserDefaults.standardUserDefaults().stringForKey(kLastLoginPwdKey);
        }
        set {
            if newValue != nil
            {
                NSUserDefaults.standardUserDefaults().gof_safeSetValue(newValue, key: kLastLoginPwdKey);
            }
            else
            {
                NSUserDefaults.standardUserDefaults().removeObjectForKey(kLastLoginPwdKey);
            }
        }
    }
    
}

