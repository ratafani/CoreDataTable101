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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mTable = CustomTable()
        self.mTable.controller = self

        self.tableView.delegate = self.mTable
        self.tableView.dataSource = self.mTable
        self.tableView.separatorStyle = .none
        // Do any additional setup after loading the view.
    }

    @IBAction func addName(_ sender: Any) {
    }
    
}

