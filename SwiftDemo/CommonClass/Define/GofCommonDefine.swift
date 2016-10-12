//
//  GofCommonDefine.swift
//  常用变量/方法定义
//
//  Created by LeeGof on 16/7/12.
//  Copyright © 2016年 hiko. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

// MARK: - 打印日志

/**
 打印日志
 
 - parameter message: 日志消息内容
 */
func printLog<T>(message: T)
{
    #if DEBUG
        print(" \(message)");
    #endif
}

// MARK: - 线程队列

/// 主线程队列
let kMainThread = dispatch_get_main_queue();
/// Global队列
let kGlobalThread = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

// MARK: - 系统版本

/// 获取系统版本号
let kSystemVersion = Float(UIDevice.currentDevice().systemVersion);
/// 是否IOS7系统
let kIsIOS7OrLater = Int(UIDevice.currentDevice().systemVersion) >= 7 ? true : false;
/// 是否IOS8系统
let kIsIOS8OrLater = Int(UIDevice.currentDevice().systemVersion) >= 8 ? true : false;
/// 是否IOS9系统
let kIsIOS9OrLater = Int(UIDevice.currentDevice().systemVersion) >= 9 ? true : false;

// MARK: - 常用宽高

/// 屏幕Bounds
let kScreenBounds = UIScreen.mainScreen().bounds;
/// 屏幕高度
let kScreenHeight = UIScreen.mainScreen().bounds.size.height;
/// 屏幕宽度
let kScreenWidth = UIScreen.mainScreen().bounds.size.width;
/// 导航栏高度
let kNavBarHeight = 44.0;
/// 状态栏高度
let kStatusBarHeight = 20.0;
/// Tab栏高度
let kTabBarHeight = 49.0;

//根据图片名称获取图片
let gof_ImageWithName: (String) -> UIImage? = {imageName in
    return UIImage(named: imageName);
}

