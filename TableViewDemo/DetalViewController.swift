//
//  DetalViewController.swift
//  TableViewDemo
//
//  Created by angcyo on 16/8/18.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit

class DetalViewController: UIViewController {

	// MARK: outlet
	@IBOutlet weak var nameField: UITextField!
	@IBOutlet weak var rateView: RateView!
	@IBOutlet weak var photoView: UIImageView!

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
		self.navigationItem.setNavigationTitleColor(UIColor.greenColor()) // 扩展:设置导航标题栏的颜色
		// self.navigationController?.navigationBar.clearBackground()//扩展:清除背景布局
		// self.navigationController?.navigationBar.tintColor = UIColor.greenColor() //左右两边item的文本颜色
		// self.navigationController?.navigationBar.barTintColor = UIColor.blackColor() // 导航栏的背景颜色
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	/*
	 // MARK: - Navigation

	 // In a storyboard-based application, you will often want to do a little preparation before navigation
	 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
	 // Get the new view controller using segue.destinationViewController.
	 // Pass the selected object to the new view controller.
	 }
	 */

}
