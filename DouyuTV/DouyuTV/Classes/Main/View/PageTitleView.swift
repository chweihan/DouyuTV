//
//  PageTitleView.swift
//  DouyuTV
//
//  Created by 陈伟涵 on 2016/10/11.
//  Copyright © 2016年 cweihan. All rights reserved.
//

import UIKit

private let kScrollLineH : CGFloat = 2

class PageTitleView: UIView {

    // MARK:- 定义属性
    var titles : [String]
    
    // MARK:- 懒加载属性
    lazy var titleLabes : [UILabel] = [UILabel]()
    lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    
    lazy var scrollLine : UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
    }()
    
    // MARK:- 自定义构造函数
    init(frame: CGRect, titles : [String]) {
        self.titles = titles
        
        super.init(frame: frame)
        
        //设置ui界面
        setupUI()
    }
    
    //重写或者自定义init方法必须实现这个方法
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PageTitleView {
    func setupUI() {
        //添加scrollView
        addSubview(scrollView)
        scrollView.frame = bounds
        
        //添加title对应的Label
        setupTitleLabels()
        
        //设置底线和滚动的滑块
        setupBottomMenuAndScrollLine()
    }
    
    private func setupTitleLabels() {
        
        let labelW : CGFloat = frame.width / CGFloat(titles.count)
        let labelH : CGFloat = frame.height - kScrollLineH
        let labelY : CGFloat = 0
        
        for (index, title) in titles.enumerated() {
            //创建uilabel
            let label = UILabel()
            
            //设置label的属性
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textColor = UIColor.darkGray
            label.textAlignment = .center
            
            //设置label的frame
            let labelX : CGFloat = labelW * CGFloat(index)
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            //将label添加到scrollView中
            scrollView.addSubview(label)
            titleLabes.append(label)
        }
    }
    
    private func setupBottomMenuAndScrollLine() {
        //添加底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let LineH : CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height, width: frame.width, height: LineH)
        addSubview(bottomLine)
        
        //添加scrollLine
        guard let firstLabel = titleLabes.first else {
            return
        }
        firstLabel.textColor = UIColor.orange
        
        //设置scrollLine的属性
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - kScrollLineH, width: firstLabel.frame.width, height: kScrollLineH)
        
    }
}

