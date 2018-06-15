//
//  ViewController.swift
//  Todoey
//
//  Created by Huang, Yiwei on 2018/05/07.
//  Copyright © 2018 Huang, Yiwei. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["task1","task2","task3"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //the first tableView is a global var
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        var newTextField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todo Items", message: "", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Create New Stuff"
            newTextField = textField
        }
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            print("add item success");
            
            self.itemArray.append(newTextField.text!)
            self.tableView.reloadData()
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    //Tableview Delegate Method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        
        if (tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark) {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true) //no gray out when tapped
    }
    
   
}

