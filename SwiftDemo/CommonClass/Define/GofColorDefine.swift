//
//  GofColorDefine.swift
//  常用颜色宏定义
//
//  Created by LeeGof on 16/7/12.
//  Copyright © 2016年 hiko. All rights reserved.
//

import Foundation
import UIKit

/// 根据RGBA生成颜色(格式为：22,22,22,0.5)
var gof_RGBAColor: (CGFloat, CGFloat, CGFloat, CGFloat) -> UIColor = {red, green, blue, alpha in
    return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha);
}

/// 根据RGB生成颜色(格式为：22,22,22)
var gof_RGBColor: (CGFloat, CGFloat, CGFloat) -> UIColor = {red, green, blue in
    return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1);
}

/// 根据色值生成颜色(无透明度)(格式为0xFFFFFF)
var gof_ColorWithHex: (NSInteger) -> UIColor = {hex in
    return UIColor(red: ((CGFloat)((hex & 0xFF0000) >> 16)) / 255.0, green: ((CGFloat)((hex & 0xFF00) >> 8)) / 255.0, blue: ((CGFloat)(hex & 0xFF)) / 255.0, alpha: 1);
}

/// 黑色
let kBColor = gof_ColorWithHex(0x000000);
/// 白色
let kWColor = gof_ColorWithHex(0xffffff)
/// 无色
let kCColor = UIColor.clearColor();
let kG1Color = gof_ColorWithHex(0x323232);
let kG2Color = gof_ColorWithHex(0x646464);
let kG3Color = gof_ColorWithHex(0x969696);
let kG4Color = gof_ColorWithHex(0xc8c8c8); // 仅使用标题栏分割线
let kG5Color = gof_ColorWithHex(0xdcdcdc); // 主页面分割线
let kG6Color = gof_ColorWithHex(0xf0f0f0); // 仅用于背景灰
let kBgColor  = gof_ColorWithHex(0xf8f8f8); // 界面背景颜色
let kHolderTipColor = gof_ColorWithHex(0xafafaf); // 提示：输入框，这个提示语的颜色
let kButtonBlueColor = gof_ColorWithHex(0x41acff);

let kLightColor = gof_ColorWithHex(0x666666);
let kGrayTitleColor = gof_ColorWithHex(0x999999);
let kGrayTipColor = gof_ColorWithHex(0x757575);

let k323232Color = gof_ColorWithHex(0x323232);
let k646464Color = gof_ColorWithHex(0x646464);
let k969696Color = gof_ColorWithHex(0x969696);
let kf0f0f0Color = gof_ColorWithHex(0xf0f0f0);

/// 三大色调
let kEssentialColor = gof_ColorWithHex(0x46a0f0);  // 主色调，蓝色
let kAssistOrangeColor = gof_ColorWithHex(0xff8c28);  // 辅色调，橙色
let kAssistGreenColor = gof_ColorWithHex(0x5abe00);  // 辅色调，绿色
