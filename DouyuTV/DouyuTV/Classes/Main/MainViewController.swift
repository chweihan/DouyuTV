//
//  MainViewController.swift
//  DouyuTV
//
//  Created by 陈伟涵 on 2016/10/11.
//  Copyright © 2016年 cweihan. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        addChildVc(storyName: "Home")
        addChildVc(storyName: "Live")
        addChildVc(storyName: "Follow")
        addChildVc(storyName: "Profile")
        
        
    }
    
    private func addChildVc(storyName : String) {
        //1 通过storyborad获取控制器
        let childVc = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!
        
        //2 将childVc作为子控制器
        addChildViewController(childVc)
    }

   
}
