//
//  DemoTableViewController.swift
//  TableViewDemo
//
//  Created by angcyo on 16/08/19.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit

class DemoTableViewController: UITableViewController {
	var datas = [DataBean]()

	override func viewDidLoad() {
		loadSampleData()
		// view.backgroundColor = UIColor.redColor()
		// tableView.backgroundColor = UIColor.init(colorLiteralRed: 0.2, green: 0.2, blue: 0.2, alpha: 0.2)
		tableView.backgroundColor = UIColor.init(white: 0.9, alpha: 0.9)

		// tableView.separatorStyle = .None //取消分割线
		tableView.separatorStyle = .SingleLine
		tableView.indicatorStyle = .Black // 滚动条的样式(黑色/白色)

		// tableView.allowsSelection = false // 不允许选中

		navigationItem.leftBarButtonItem = editButtonItem()
	}

	// MARK: table 中有多少个分组
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}

	// MARK: 每个分组中的行数
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return datas.count
	}

	// MARK:每一行中需要显示的内容
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cellIdentifier = "DemoTableViewCell"
		// MARK: 从缓存中获取一个cell
		let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! TableCell
		// cell.contentView.backgroundColor = UIColor.clearColor()

		cell.backgroundColor = UIColor.clearColor() // 透明
		cell.contentView.backgroundColor = UIColor.clearColor() // 透明

		cell.contentView.backgroundColor = UIColor(white: 0, alpha: 0)
		// cell.contentView.alpha = 0
		let bean = datas[indexPath.row]
		cell.nameLabel.text = bean.name
		cell.photoImageView.image = bean.image
		cell.rateView.rating = bean.rate

		// MARK:添加星星改变的回调方法
		cell.rateView.onRatingChange = { rating in
			self.datas[indexPath.row].rate = rating
			print("row:\(indexPath.row) rate:\(rating)  --:\(bean.rate)")
		}

		return cell
	}

	// MARK: 从详细页面返回
	@IBAction func unwindSegueFromDetal(sender: UIStoryboardSegue) {
		if let detalViewController = sender.sourceViewController as? DetalViewController, dataBean = detalViewController.dataBean {

			if let selectorIndexPath = tableView.indexPathForSelectedRow {
				datas[selectorIndexPath.row] = dataBean
				tableView.reloadRowsAtIndexPaths([selectorIndexPath], withRowAnimation: .Top)
			} else {
				let indexPath = NSIndexPath(forRow: datas.count, inSection: 0)
				// datas += [dataBean]
				datas.append(dataBean)
				self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .None)
			}

		}
	}

	// MARK:编辑模式下的删除回调
	override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
		if editingStyle == .Delete {
			// 删除
			datas.removeAtIndex(indexPath.row)
			tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
		} else if editingStyle == .Insert {
			// 插入
		}
	}

	// MARK: 指定的行,是否可以编辑
	override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
		return indexPath.row > 2
	}

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		print("prepareForSegue \(segue.identifier)")
		if segue.identifier == "AddItemSegue" {

		} else if segue.identifier == "CellSegue" {
			if let detalVC = segue.destinationViewController as? DetalViewController, cell = sender as? TableCell {
				detalVC.dataBean = datas[tableView.indexPathForCell(cell)!.row]
			}
		}
	}
}

//MARK: 数据操作
extension DemoTableViewController {
	func loadSampleData() {

		// MARK: 2x
		let bean2 = DataBean(name: "name1", rate: 0, image: UIImage(named: "bochan"))
		let bean3 = DataBean(name: "name2", rate: 1, image: UIImage(named: "himawari"))
		let bean4 = DataBean(name: "name3", rate: 2, image: UIImage(named: "kazama"))
		let bean5 = DataBean(name: "name4", rate: 3, image: UIImage(named: "masao"))
		// MARK: 1x
		let bean6 = DataBean(name: "name5", rate: 4, image: UIImage(named: "nene"))
		let bean7 = DataBean(name: "name6", rate: 4, image: UIImage(named: "shin"))
		let bean8 = DataBean(name: "name7", rate: 5, image: UIImage(named: "xiaoxin"))
		let bean9 = DataBean(name: "name8", rate: 5, image: UIImage(named: "xiaoxinkutou"))

		datas += [bean2, bean3, bean4, bean5, bean6, bean7, bean8, bean9]
//		datas.append(bean2)
	}
}
