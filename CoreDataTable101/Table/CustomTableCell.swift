//
//  CustomTableCell.swift
//  CoreDataTable101
//
//  Created by Muhammad Tafani Rabbani on 11/08/20.
//  Copyright © 2020 Muhammad Tafani Rabbani. All rights reserved.
//


import UIKit
import CoreData

class CustomTableCell: UITableViewCell {
    
    var mTitle : DataModel?
    
    @IBOutlet weak var cellTxt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if let title = mTitle?.name{
            cellTxt.text = title
        }
        let ontap = UITapGestureRecognizer(target: self, action: #selector(showAlert))
        self.addGestureRecognizer(ontap)
        
    }
    
    
    @objc func showAlert(){
        
        let alertController = UIAlertController(title: "Update the item", message: "", preferredStyle: UIAlertController.Style.alert)
       
        let saveAction = UIAlertAction(title: "Update", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let firstTextField = alertController.textFields![0] as UITextField
            let name = firstTextField.text
            let manager = CDManager()
            
            manager.updateData(id: self.mTitle?.id ?? NSManagedObjectID(), newName: name ?? "")
        })
        
        let deleteAction = UIAlertAction(title: "Delete", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let manager = CDManager()
            
            manager.deleteData(id: self.mTitle?.id ?? NSManagedObjectID())
        })
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
            (action : UIAlertAction!) -> Void in })
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Name"
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    override func layoutSubviews() {
        selectionStyle = .none
        
    }
    
}
