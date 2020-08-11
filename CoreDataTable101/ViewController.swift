//
//  ViewController.swift
//  CoreDataTable101
//
//  Created by Muhammad Tafani Rabbani on 11/08/20.
//  Copyright © 2020 Muhammad Tafani Rabbani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    
    var mTable : CustomTable!
    var manager : CDManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = CDManager()
        
//        print(manager?.listData)
        self.mTable = CustomTable()
        self.mTable.controller = self
        self.mTable.modelData = manager?.listData
        
        self.tableView.delegate = self.mTable
        self.tableView.dataSource = self.mTable
        self.tableView.separatorStyle = .none
//        self.tableView.reloadData()
        // Do any additional setup after loading the view.
    }

    @IBAction func addName(_ sender: Any) {
        if let name = nameTextField.text{
            self.manager?.saveData(name: name)
        }
        //update List after add
        self.manager = CDManager()
//        print(manager?.listData)
        self.mTable.modelData = manager?.listData
        self.tableView.dataSource = self.mTable
        self.tableView.reloadData()
        
        
    }
    
}

