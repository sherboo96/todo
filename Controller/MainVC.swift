//
//  ViewController.swift
//  ToDo-List
//
//  Created by Mahmoud Sherbeny on 10/1/20.
//  Copyright © 2020 Mahmoud Sherbeny. All rights reserved.
//

import UIKit

class MainVC: UITableViewController {
    
    //MARK: - Variables
    var cellItem: Item
    
    required init?(coder: NSCoder) {
        cellItem = Item()
        cellItem.itemName = "First"
        cellItem.itemMark = false
        super.init(coder: coder)
    }
    //MARK: - VC LifrCycel
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - TableView Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if let label = cell.viewWithTag(1) as? UILabel {
            if indexPath.row == 0 {
                label.text = cellItem.itemName
            } else if indexPath.row % 5 == 1 {
                label.text = "Watch a Movie"
            } else if indexPath.row % 5 == 2 {
                label.text = "Code an App"
            } else if indexPath.row % 5 == 3 {
                label.text = "Walk the Dog"
            } else if indexPath.row % 5 == 4 {
                label.text = "Study Design Pattern"
            }
        }
        configureCheckMark(for: cell, at: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            configureCheckMark(for: cell, at: indexPath)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Helper Function
    func configureCheckMark(for cell: UITableViewCell, at indexPath: IndexPath) {
        if indexPath.row == 0 {
            if cellItem.itemMark! {
                cell.accessoryType = .none
            } else {
                cell.accessoryType = .checkmark
            }
            cellItem.itemMark = !cellItem.itemMark!
        } else {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
    }
}

