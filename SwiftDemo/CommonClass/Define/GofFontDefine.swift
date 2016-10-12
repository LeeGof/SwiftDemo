//
//  GofFontDefine.swift
//  常用字体宏定义
//
//  Created by LeeGof on 16/7/12.
//  Copyright © 2016年 hiko. All rights reserved.
//

import Foundation
import UIKit

/// 系统普通字体
var gof_SystemFontWithSize: (CGFloat) -> UIFont = {size in
    return UIFont.systemFontOfSize(size);
}

/// 系统加粗字体
var gof_BoldFontWithSize: (CGFloat) -> UIFont = {size in
    return UIFont.boldSystemFontOfSize(size);
}

/// 仅用于标题栏上，大标题字号
let kNavFont = gof_SystemFontWithSize(18);

/// 标题字号
let kTitleFont = gof_SystemFontWithSize(18);

/// 正文字号
let kBodyFont = gof_SystemFontWithSize(16);

/// 辅助字号
let kAssistFont = gof_SystemFontWithSize(14);


