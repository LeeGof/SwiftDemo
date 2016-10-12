//
//  GofImageScrollView.swift
//  图片滚动视图
//
//  Created by LeeGof on 16/7/14.
//  Copyright © 2016年 hiko. All rights reserved.
//

import UIKit

/**
 图片存储类型
 
 - Local:   本地图片
 - Network: 网络图片
 */
enum GofImageStoreType: Int
{
    case Local = 0;
    case Network;
}

class GofImageScrollView: UIView
{
    /// 图片数组
    private var arrImage: [String]?;
    /// 分页
    private var imgPageControl: UIPageControl?;
    /// 按钮单击回调Block
    private var btnClick: GofBtnClickBlock?;
    /// 滚动视图
    private var imgScrollView: UIScrollView?;
    /// 计时器
    private var timer: NSTimer?;
    /// 当前页索引
    private var iCurrentIndex: NSInteger?;
    
    /**
     创建GofImageScrollView
     
     - parameter array:         图片数组(本地图片传图片名称数组,网络图片传图片URL数组,均为字符串数组)
     - parameter storeType:     图片存储类型(网络图片/本地图片)
     - parameter btnClickBlock: 按钮单击处理
     - parameter superView:     父视图
     - parameter constraints:   约束
     
     - returns: GofImageScrollView
     */
    static func gof_ImageScrollView(array: [String], storeType: GofImageStoreType, btnClickBlock: GofBtnClickBlock?, superView: UIView?, constraints: GofConstraintMaker?) -> GofImageScrollView
    {
        let scroll = GofImageScrollView();
        
        if superView != nil
        {
            superView!.addSubview(scroll);
            
            if constraints != nil
            {
                scroll.snp_makeConstraints(closure: { (make) in
                    constraints!(make);
                })
                
                scroll.showScrollViewWithImageArray(array, storeType: storeType, btnClickBlock: btnClickBlock);
            }
        }
        
        return scroll;
    }
    
    /**
     显示图片轮播
     
     - parameter array:         图片数组(本地图片传图片名称数组,网络图片传图片URL数组,均为字符串数组)
     - parameter storeType:     图片存储类型(网络图片/本地图片)
     - parameter btnClickBlock: 按钮单击处理
     */
    func showScrollViewWithImageArray(array: [String], storeType: GofImageStoreType, btnClickBlock: GofBtnClickBlock?)
    {
        //变量赋值
        arrImage = array;
        btnClick = btnClickBlock;
        iCurrentIndex = 1;
        
        //滚动视图
        imgScrollView = UIScrollView.init();
        imgScrollView!.delegate = self
        imgScrollView!.pagingEnabled = true;
        imgScrollView!.contentSize = CGSizeMake(self.bounds.size.width * CGFloat(array.count + 2), 0);
        imgScrollView!.contentOffset = CGPointMake(self.bounds.size.width * 2, 0);
        imgScrollView!.showsHorizontalScrollIndicator = false;
        imgScrollView!.showsVerticalScrollIndicator = false;
        self.addSubview(imgScrollView!);
        imgScrollView?.snp_makeConstraints(closure: { (make) in
            make.edges.equalTo(self);
        });
        
        //内容容器视图
        let containerView = UIView();
        imgScrollView?.addSubview(containerView);
        containerView.snp_makeConstraints { (make) in
            make.edges.equalTo(self.imgScrollView!);
            make.top.equalTo(0);
            make.height.equalTo(self);
        }
        
        //分页小圆点
        imgPageControl = UIPageControl.init();
        imgPageControl?.numberOfPages = array.count;
        imgPageControl?.currentPage = 0;
        imgPageControl?.userInteractionEnabled = false;
        imgPageControl?.currentPageIndicatorTintColor = UIColor.greenColor();
        imgPageControl?.pageIndicatorTintColor = UIColor.grayColor();
        self.addSubview(imgPageControl!);
        imgPageControl?.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(0);
            make.top.equalTo(self.snp_bottom).offset(-20);
            make.right.equalTo(0);
            make.height.equalTo(20);
        })
        
        //添加图片
        for i in 0...array.count - 1
        {
            //图片
            let button = UIButton.gof_buttonWithTitle(nil, superView: containerView, constraints: { (make) in
                    make.leading.equalTo(kScreenWidth * CGFloat(i + 1));
                    make.top.equalTo(0);
                    make.width.equalTo(kScreenWidth);
                    make.bottom.equalTo(0);
                }, touchup: { [unowned self] (btn) in
                    if (self.btnClick != nil)
                    {
                        self.btnClick(btn);
                    }
            });
            button.tag = 100 + i;
            if .Local == storeType
            {
                button.setImage(gof_ImageWithName(array[i > (array.count - 1) ? 0 : i] ), forState: .Normal);
            }
            else
            {
                button.kf_setImageWithURL(NSURL(string: array[i > (array.count - 1) ? 0 : i] ), forState: .Normal);
            }
        }
        
        //右边加个图片用于过渡
        let rightButton = UIButton.gof_buttonWithTitle(nil, superView: containerView, constraints: { (make) in
                make.leading.equalTo(kScreenWidth * CGFloat(array.count + 1));
                make.top.equalTo(0);
                make.width.equalTo(kScreenWidth);
                make.bottom.equalTo(0);
            }, touchup: { [unowned self] (btn) in
                if (self.btnClick != nil)
                {
                    self.btnClick(btn);
                }
            });
        rightButton.tag = 100;

        //左边加个图片用于过渡
        let leftButton = UIButton.gof_buttonWithTitle(nil, superView: containerView, constraints: { (make) in
                make.leading.equalTo(0);
                make.top.equalTo(0);
                make.width.equalTo(kScreenWidth);
                make.bottom.equalTo(0);
            }, touchup: { [unowned self] (btn) in
                if (self.btnClick != nil)
                {
                    self.btnClick(btn);
                }
            });
        leftButton.tag = 100 + array.count - 1;
        
        containerView.snp_makeConstraints { (make) in
            make.right.equalTo(rightButton);
        }
        
        if .Local == storeType
        {
            rightButton.setImage(gof_ImageWithName(array[0]), forState: .Normal);
            leftButton.setImage(gof_ImageWithName(array[array.count - 1]), forState: .Normal);
        }
        else
        {
            rightButton.kf_setImageWithURL(NSURL(string: array[0]), forState: .Normal);
            leftButton.kf_setImageWithURL(NSURL(string: array[array.count - 1]), forState: .Normal);
        }
        
        self.startScrollForInit();
    }
    
    /**
     初始化操作
     */
    func startScrollForInit()
    {
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(startScroll), userInfo: nil, repeats: true);
    }
    
    /**
     设置初始滚动位置并开启定时任务
     */
    func startScroll()
    {
        self.scrollToInit();
        
        //启动定时器
        self.startTime();
    }
    
    /**
     按钮点击
     
     - parameter btn: 按钮
     */
    func btnClick(btn:UIButton) -> Void
    {
        if (btnClick != nil)
        {
            btnClick!(btn);
        }
    }
    
    /**
     开启计时器
     */
    func startTime() -> Void
    {
        
        if timer == nil
        {
            timer = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: #selector(scrollForTime), userInfo: nil, repeats: true);
        }
    }
    
    /**
     添加滚动
     */
    func scrollForTime() -> Void
    {
        iCurrentIndex = iCurrentIndex! + 1;
        if iCurrentIndex == arrImage!.count + 1
        {
            imgScrollView!.setContentOffset(CGPointMake(self.bounds.size.width * CGFloat(iCurrentIndex!), 0), animated:true);
            iCurrentIndex = 1;
            self.performSelector(#selector(scrollToInit), withObject: nil, afterDelay: 0.5);
        }
        else
        {
            imgScrollView!.setContentOffset(CGPointMake(self.bounds.size.width * CGFloat(iCurrentIndex!), 0), animated:true);
        }
        imgPageControl!.currentPage = iCurrentIndex! - 1;
    }
    
    /**
     回到原点
     */
    func scrollToInit() -> Void
    {
        imgScrollView!.setContentOffset(CGPointMake(self.bounds.size.width * CGFloat(iCurrentIndex!), 0), animated:false);
    }
}

extension GofImageScrollView: UIScrollViewDelegate
{
    func scrollViewWillBeginDragging(scrollView: UIScrollView)
    {
        if timer != nil
        {
            timer!.invalidate();
            timer = nil;
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView)
    {
        let index: NSInteger = NSInteger(scrollView.contentOffset.x / kScreenWidth);
        
        if index == (arrImage!.count + 1)
        {
            scrollView.contentOffset = CGPointMake(self.bounds.size.width, 0);
            imgPageControl!.currentPage = 0;
            iCurrentIndex = 1;
        }
        else if index == 0
        {
            scrollView.contentOffset = CGPointMake(CGFloat(arrImage!.count) * self.bounds.size.width, 0);
            imgPageControl!.currentPage = arrImage!.count - 1;
            iCurrentIndex = arrImage!.count;
        }
        else
        {
            imgPageControl!.currentPage = index - 1;
            iCurrentIndex = index;
        }
        self.startTime();
        
        self.printAA();
        self.printBB();
    }
}

extension GofImageScrollView
{
    
    func printAA()
    {
        printLog("aa");
    }
}

extension GofImageScrollView
{
    func printBB()
    {
        printLog("bb");
    }
}