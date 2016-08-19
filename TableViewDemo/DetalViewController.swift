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
	@IBOutlet weak var saveButtonItem: UIBarButtonItem!

	var dataBean: DataBean!

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
		self.navigationItem.setNavigationTitleColor(UIColor.greenColor()) // 扩展:设置导航标题栏的颜色
		// self.navigationController?.navigationBar.clearBackground()//扩展:清除背景布局
		// self.navigationController?.navigationBar.tintColor = UIColor.greenColor() //左右两边item的文本颜色
		// self.navigationController?.navigationBar.barTintColor = UIColor.blackColor() // 导航栏的背景颜色

		nameField.delegate = self
		addTextFieldChangedListener(nameField)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	/*
	 // MARK: - Navigation

	 // In a storyboard-based application, you will often want to do a little preparation before navigation
	 */

	// MARK: 🔙返回
	@IBAction func onCancelTapped(sender: UIBarButtonItem) {
		dismissViewControllerAnimated(true, completion: nil)
	}

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if saveButtonItem === sender {
			print("this")
			dataBean = DataBean(name: nameField.text!, rate: rateView.rating, image: photoView.image)
		}
	}
}

//MARK: 扩展键盘隐藏
extension DetalViewController: UITextFieldDelegate {

	func addTextFieldChangedListener(textField: UITextField) {
		textField.addTarget(self, action: #selector(onValueChanged(_:)), forControlEvents: .ValueChanged)
		textField.addTarget(self, action: #selector(onEdittingChanged(_:)), forControlEvents: .EditingChanged)
	}

	func onValueChanged(sender: UITextField) {
		print("onValueChanged \(sender.text)")
	}

	// MARK: 当文本框编辑完成后
	func onEdittingChanged(sender: UITextField) {
		print("onEdittingChanged \(sender.text)")
		let text = sender.text ?? ""
		saveButtonItem.enabled = !text.isEmpty
	}

	func textFieldShouldReturn(textField: UITextField) -> Bool {
		// MARK:键盘按return之后
		textField.resignFirstResponder()
		return true
	}
//
//	func textFieldDidEndEditing(textField: UITextField) {
//		//
//		print("2")
//	}

	// MARK: 检查文本是否为空, 不为空激活保存按钮
	func checkValidName() {
		let name = nameField.text ?? ""
		saveButtonItem.enabled = !name.isEmpty
	}

	func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
		print("\(#function)")
		return true
	}

	func textFieldDidBeginEditing(textField: UITextField) {
		print("\(#function)")
	}

	func textFieldShouldEndEditing(textField: UITextField) -> Bool {
		print("\(#function)")
		return true
	}

	func textFieldDidEndEditing(textField: UITextField) {
		print("\(#function)")

		let text = textField.text ?? ""
		if !text.isEmpty {
			navigationItem.title = text

			if let titleView = navigationItem.titleView as? UILabel {
				titleView.text = text
				titleView.sizeToFit()
			}
		}
	}

	func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
		print("\(#function) \(textField.text) \(range) \(string)")
		return true
	}

	func textFieldShouldClear(textField: UITextField) -> Bool {
		print("\(#function)")
		return true
	}
//	func textFieldShouldReturn(textField: UITextField) -> Bool {
//		print("\(#function)")
//		textField.resignFirstResponder()
//		return true
//	}
}
