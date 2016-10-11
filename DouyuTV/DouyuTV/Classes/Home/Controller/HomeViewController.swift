//
//  HomeViewController.swift
//  DouyuTV
//
//  Created by 陈伟涵 on 2016/10/11.
//  Copyright © 2016年 cweihan. All rights reserved.
//

import UIKit

private let kPageTitleViewH : CGFloat = 40

class HomeViewController: UIViewController {

    // MARK:- 懒加载属性
    lazy var pageTitleView : PageTitleView = {
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kPageTitleViewH)
        let titles = ["推荐","游戏","娱乐","趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        return titleView
    }()
    
    // MARK:- 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置ui界面
        setupUI()
    }
}

// MARK:- 设置ui界面
extension HomeViewController {
    func setupUI() {
        //不需要调整UIScrollView的内边距
        automaticallyAdjustsScrollViewInsets = false
        //设置导航栏
        setupNavigationBar()
        //添加titleView
        view.addSubview(pageTitleView)
    }
    
    private func setupNavigationBar() {
        //设置左边的item
        navigationItem.leftBarButtonItem = UIBarButtonItem("logo", "", CGSize.zero)
        //设置右边的item
        let size = CGSize(width: 44, height: 44)
        let historyItem = UIBarButtonItem("image_my_history", "Image_my_history_click", size)
        let searchItem = UIBarButtonItem("btn_search", "btn_search_clicked", size)
        let qrcodeItem = UIBarButtonItem("Image_scan", "Image_scan_click", size)
        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem]
        
    }
    
}
