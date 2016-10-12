//
//  NSUserDefaults+GofUserDefaults.swift
//  SwiftDemo
//
//  Created by LeeGof on 16/7/13.
//  Copyright © 2016年 hiko. All rights reserved.
//

import Foundation

extension NSUserDefaults
{
    func gof_safeSetValue(value:AnyObject?, key: String) -> Bool
    {
        if value != nil
        {
            self.setValue(value, forKey: key);
            return self.synchronize();
        }
        else
        {
            printLog("value为空，不能存储");
            return false;
        }
    }
    
}
