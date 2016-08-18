//
//  RateView.swift
//  TableViewDemo
//
//  Created by angcyo on 16/08/18.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit

class RateView: UIView {

	// MARK: 星星之间的间距
	var space = 5 {
		didSet {
			setNeedsLayout()
		}
	}

	// MARK: 星星的个数
	var rate = 5 {
		willSet {
		}
		didSet {
			initButton()
		}
	}

	// MARK: 当前星星选中星星的个数
	var rating = 0 {
		didSet {
			rating = min(ratingButton.count, rating)
			updateSelectionStates()
		}
	}
	var ratingButton = [UIButton]()

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		initButton()
	}

	override func layoutSubviews() {
		print("layoutSubViews")
		let size = Int(self.frame.size.height)
		var buttonFrame = CGRect(x: 0, y: 0, width: size, height: size)
		for (index, button) in ratingButton.enumerate() {
			buttonFrame.origin.x = CGFloat((size + space) * index)
			button.frame = buttonFrame
		}
		updateSelectionStates()
	}
}

extension RateView {
	func initButton() {
		for (_, button) in ratingButton.enumerate() {
			button.removeFromSuperview()
		}

		ratingButton.removeAll()

		for _ in 0..<rate {
			addButton()
		}
	}
}

extension RateView {

	// MARK: 选中的星星图片
	var fillImage: UIImage {
		get {
			return UIImage(named: "StarFill")!
		}
	}

	// MARK: 未选中的默认图片
	var emptyImage: UIImage {
		get {
			return UIImage(named: "StarEmpty")!
		}
	}

	func addButton() {
		let button = UIButton()
		button.adjustsImageWhenHighlighted = false
		button.setImage(emptyImage, forState: .Normal)
		button.setImage(fillImage, forState: .Selected)
		button.setImage(fillImage, forState: [.Highlighted, .Selected])
		button.addTarget(self, action: #selector(onButtonTapped(_:)), forControlEvents: .TouchDown)

		ratingButton += [button]
		self.addSubview(button)
	}

	func updateSelectionStates() {
		for (index, button) in ratingButton.enumerate() {
			button.selected = index < rating
		}
	}

	func onButtonTapped(sender: UIButton) {
		rating = ratingButton.indexOf(sender)! + 1
		updateSelectionStates()
	}
}
