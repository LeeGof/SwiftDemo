//
//  UIImageView+GofImageViewMaker.swift
//  创建UIImageView
//
//  Created by LeeGof on 16/7/12.
//  Copyright © 2016年 hiko. All rights reserved.
//

import UIKit

extension UIImageView
{
    /**
     创建UIImageView
     
     - parameter imageName:   图片名称/图片
     - parameter superView:   父视图
     - parameter constraints: 约束
     
     - returns: UIImageView
     */
    static func gof_imageViewWithObject<T>(imageName: T?, superView: UIView?, constraints: GofConstraintMaker?) -> UIImageView
    {
        let imageView = UIImageView();
        
        if imageName != nil
        {
            if let image = imageName as? String
            {
                imageView.image = gof_ImageWithName(image);
            }
            else if let image = imageName as? UIImage
            {
                imageView.image = image;
            }
        }
        
        if superView != nil
        {
            superView?.addSubview(imageView);
            
            if constraints != nil
            {
                imageView.snp_makeConstraints(closure: { (make) in
                    constraints!(make);
                })
            }
        }
        
        return imageView;
    }
    
    static func gof_imageViewWithImage(imageName: String?, superView: UIView?, constraints: GofConstraintMaker?) -> UIImageView
    {
        return self.gof_imageViewWithObject(imageName, superView: superView, constraints: constraints);
    }
}