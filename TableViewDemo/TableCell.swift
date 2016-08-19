//
//  TableCell.swift
//  TableViewDemo
//
//  Created by angcyo on 16/08/18.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit

//MARK: 表格的每一行
class TableCell: UITableViewCell {

	@IBOutlet weak var photoImageView: UIImageView!

	@IBOutlet weak var nameLabel: UILabel!

	@IBOutlet weak var rateView: RateView!
}
