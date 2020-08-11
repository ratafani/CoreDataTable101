//
//  CustomTableCell.swift
//  CoreDataTable101
//
//  Created by Muhammad Tafani Rabbani on 11/08/20.
//  Copyright © 2020 Muhammad Tafani Rabbani. All rights reserved.
//


import UIKit

class CustomTableCell: UITableViewCell {
    
    var mTitle : String = "test"
        
    @IBOutlet weak var cellTxt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        cellTxt.text = mTitle
//        if let title = mTitle{
//
//        }
        
    }

    override func layoutSubviews() {
        selectionStyle = .none
     
    }

}
