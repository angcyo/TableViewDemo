//
//  RateTestViewController.swift
//  TableViewDemo
//
//  Created by angcyo on 16/08/18.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit

class RateTestViewController: UIViewController {
	// MARK: button

	@IBOutlet weak var rateButton: UIButton!

	@IBOutlet weak var ratingButton: UIButton!

	@IBOutlet weak var spaceButton: UIButton!
	@IBOutlet weak var rateView: RateView!

	@IBAction func onRateTapped(sender: UIButton) {
		rateView.rate += 1
	}
	@IBAction func onRatingTapped(sender: UIButton) {
		rateView.rating += 1
	}
	@IBAction func onSpaceTapped(sender: UIButton) {
		rateView.space += 1
	}
	@IBAction func onDismiss() {
		dismissViewControllerAnimated(true, completion: nil)
	}
}
