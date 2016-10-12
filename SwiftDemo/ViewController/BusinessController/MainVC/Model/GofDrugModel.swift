//
//  GofDrugModel.swift
//  SwiftDemo
//
//  Created by LeeGof on 16/8/2.
//  Copyright © 2016年 hiko. All rights reserved.
//

import Foundation

class GofDrugModel
{
    var gaPrefix : String!;
    var id : Int!;
    var image : String!;
    var title : String!;
    var type : Int!;
    
    /**
     字典初始化
     
     - parameter dictionary: 字典
     
     - returns: self
     */
    init?(fromDictionary dictionary: NSDictionary?)
    {
        if dictionary == nil
        {
            return nil;
        }
        gaPrefix = dictionary!["ga_prefix"] as? String;
        id = dictionary!["id"] as? Int;
        image = dictionary!["image"] as? String;
        title = dictionary!["title"] as? String;
        type = dictionary!["type"] as? Int;
    }
    
    /**
     转化成字典
     
     - returns: 字典
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary();
        if gaPrefix != nil{
            dictionary["ga_prefix"] = gaPrefix;
        }
        if id != nil{
            dictionary["id"] = id;
        }
        if image != nil{
            dictionary["image"] = image;
        }
        if title != nil{
            dictionary["title"] = title;
        }
        if type != nil{
            dictionary["type"] = type;
        }
        return dictionary;
    }
}