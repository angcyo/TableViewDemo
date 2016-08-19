//
//  DataBean.swift
//  TableViewDemo
//
//  Created by angcyo on 16/08/19.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit

class DataBean {
	var image: UIImage?
	var name: String
	var rate: Int
	init(name: String, rate: Int, image: UIImage?) {
		self.image = image
		self.rate = rate
		self.name = name
	}
}
