//
//  BaseExtension.swift
//  TableViewDemo
//
//  Created by angcyo on 16/8/18.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit

//MARK: 扩展导航栏-标题
extension UINavigationItem {
	// MARK: 设置导航栏的标题颜色
	func setNavigationTitleColor(color: UIColor) {
		let lable = UILabel()
		lable.text = title
		lable.textColor = color
		lable.sizeToFit()
		titleView = lable
	}
}

//MARK: 扩展导航栏
extension UINavigationBar {
	// MARK: 清除导航栏的背景, 实现全透明的效果
	func clearBackground() {
		let view = subviews[0]
		if view.isKindOfClass(UIImageView) {
			view.removeFromSuperview()
		}
	}
}