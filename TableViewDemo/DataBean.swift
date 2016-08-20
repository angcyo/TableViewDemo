//
//  DataBean.swift
//  TableViewDemo
//
//  Created by angcyo on 16/08/19.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit

class DataBean: NSObject, NSCoding {

	// MARK: 如果文件夹不存在则, 创建
	private static var DocumentDirectory: NSURL {
		let fileManager = NSFileManager.defaultManager()
		let docPath = fileManager.URLsForDirectory(.DocumentationDirectory, inDomains: .UserDomainMask).first!
		if !fileManager.fileExistsAtPath(docPath.path!) {
			try! fileManager.createDirectoryAtPath(docPath.path!, withIntermediateDirectories: true, attributes: nil)
		}
		return docPath
	}
	static let DataPathUrl = DocumentDirectory.URLByAppendingPathComponent("data_bean_s")

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