//
//  UIBarButtonItem-Extension.swift
//  DouyuTV
//
//  Created by 陈伟涵 on 2016/10/11.
//  Copyright © 2016年 cweihan. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    /*
    class func createItem(_ imageName : String , _ highImageName : String , _ size : CGSize) -> UIBarButtonItem {
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: highImageName), for: .highlighted)
        btn.frame = CGRect(origin: CGPoint.zero, size: size)
        return UIBarButtonItem(customView: btn)
    }
    */
    
    //遍历构造函数 1> convenience开头 2> 在构造行数中必须明确调用一个设计的构造行数(self)
    convenience init(_ imageName : String , _ highImageName : String = "", _ size : CGSize = CGSize.zero) {
        //创建UIButton
        let btn = UIButton()
        //设置btn的图片
        btn.setImage(UIImage(named: imageName), for: .normal)
        if highImageName != "" {
            btn.setImage(UIImage(named: highImageName), for: .highlighted)
        }
        //设置btn的尺寸
        if size == CGSize.zero {
            btn.sizeToFit()
        }else {
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        //创建UIBarButtonItem
        self.init(customView: btn)
    }
    
}


