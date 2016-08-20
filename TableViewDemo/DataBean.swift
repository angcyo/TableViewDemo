//
//  DataBean.swift
//  TableViewDemo
//
//  Created by angcyo on 16/08/19.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit

class DataBean: NSObject, NSCoding {
	var image: UIImage?
	var name: String
	var rate: Int
	init?(name: String, rate: Int, image: UIImage?) {
		self.image = image
		self.rate = rate
		self.name = name

		super.init()

		if name.isEmpty || rate < 0 {
			return nil
		}
	}

	override var description: String {
		return "image:\(image) name:\(name) rate:\(rate)"
	}

	required convenience init?(coder aDecoder: NSCoder) {
		let image = aDecoder.decodeObjectForKey(DataKey.imageKey) as! UIImage
		let name = aDecoder.decodeObjectForKey(DataKey.nameKey) as! String
		let rate = aDecoder.decodeIntegerForKey(DataKey.rateKey)

		self.init(name: name, rate: rate, image: image)
	}

	func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(image, forKey: DataKey.imageKey)
		aCoder.encodeObject(name, forKey: DataKey.nameKey)
		aCoder.encodeInteger(rate, forKey: DataKey.rateKey)
	}
}

struct DataKey {
	static let imageKey = "image"
	static let nameKey = "name"
	static let rateKey = "rate"
}