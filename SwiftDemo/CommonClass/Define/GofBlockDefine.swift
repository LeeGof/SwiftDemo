//
//  GofBlockDefine.swift
//  常用Block宏定义
//
//  Created by LeeGof on 16/7/12.
//  Copyright © 2016年 hiko. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

/// SnapKit约束闭包类型
typealias GofConstraintMaker = (ConstraintMaker) -> Void;

/// 按钮点击回调闭包类型
typealias GofBtnClickBlock = @convention(block)(UIButton) -> Void;

/// 只带一个error参数的失败闭包类型，主要用于处理失败回调
typealias GofErrorBlock = (NSError) -> Void;

/// 只带一个errorMessage参数的失败闭包类型，主要用于处理失败回调
typealias GofErrorMessageBlock = (String) -> Void;

/// 通用的空闭包类型，无参数，无返回值
typealias GofVoidBlock = (Void) -> Void;

/// 通知的闭包类型
typealias GofNotificationBlock = (NSNotification) -> Void;

/// 常用的Bool类型参数的闭包类型
typealias GofBoolBlock = (Bool) -> Void;

/// 常用的Bool类型和相应提示语参数的闭包类型
typealias GofBoolMsgBlock = (Bool, String) -> Void;

/// 常用的数组类型参数的闭包类型
typealias GofArrayBlock = ([AnyObject]) -> Void;

/// 常用的数组类型和错误提示语参数的闭包类型
typealias GofArrayMsgBlock = ([AnyObject], String) -> Void;

/// 常用的字典类型参数的闭包类型
typealias GofDictionaryBlock = ([String: Any]) -> Void;

/// 常用的字典类型和错误提示语参数的闭包类型
typealias GofDictionaryMsgBlock = ([String: Any], String) -> Void;

/// 常用的Int类型参数的闭包类型
typealias GofIntBlock = (Int) -> Void;

/// 常用的Int类型和错误提示语参数的闭包类型
typealias GofIntMsgBlock = (Int, String) -> Void;

/// 常用的String类型参数的闭包类型
typealias GofStringBlock = (String) -> Void;

/// 常用的String类型和错误提示语参数的闭包类型
typealias GofStringMsgBlock = (String, String) -> Void;

/// 常用的任何类型(包括函数类型）参数的闭包类型
typealias GofAnyBlock = (Any) -> Void;

/// 常用的任何类型(包括函数类型）和错误提示语参数的闭包类型
typealias GofAnyMsgBlock = (Any, String) -> Void;

/// 常用的任何类类型参数的闭包类型
typealias GofAnyObjectBlock = (AnyObject) -> Void;

/// 常用的任何类类型和错误提示语参数的闭包类型
typealias GofAnyObjectMsgBlock = (AnyObject, String) -> Void;

/// 常用的无参数返回任何类类型数组的闭包类型
typealias GofVoidWithRetAnyObjectBlock = () -> [AnyObject];

/// 常用的手势回调的闭包类型
typealias GofGestureBlock = (UIGestureRecognizer) -> Void;

