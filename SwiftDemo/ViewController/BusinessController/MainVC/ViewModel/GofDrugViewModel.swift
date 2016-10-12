//
//  GofDrugViewModel.swift
//  SwiftDemo
//
//  Created by LeeGof on 16/8/2.
//  Copyright © 2016年 hiko. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias GofArrayDrugModelBlock = ([GofDrugModel]) -> Void;
class GofDrugViewModel
{
    static func gof_getDrugViewModelWithSuccess(gofDrugViewModelArr: GofArrayDrugModelBlock)
    {
        Alamofire.request(.GET, "http://news-at.zhihu.com/api/4/news/latest")
            .validate()
            .responseString { response in
                printLog("Success: \(response.result.isSuccess)");
                let jsonStr = JSON.parse(response.result.value!).dictionaryValue;
                let array = jsonStr["stories"]?.arrayObject;
                var retArray: [GofDrugModel] = [];
                
                
                for (_, dicObject) in (array?.enumerate())!
                {
                    if let model = GofDrugModel(fromDictionary: dicObject as? NSDictionary)
                    {
                        retArray.append(model);
                    }
                }
                
                gofDrugViewModelArr(retArray);
                printLog("Response String: \(retArray)");
        }
    }
}
