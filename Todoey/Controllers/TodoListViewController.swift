//
//  ViewController.swift
//  Todoey
//
//  Created by Huang, Yiwei on 2018/05/07.
//  Copyright © 2018 Huang, Yiwei. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let task1 = Item(title: "task1")
        itemArray.append(task1)
        
//        if let items = defaults.array(forKey: "TodoItems") as? [String] {
//            itemArray = items
//        }
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //the first tableView is a global var
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        
        return cell
    }
    
    //Tableview Delegate Method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true) //no gray out when tapped
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
            
            guard let title = newTextField.text else {
                return
            }
            let newItem = Item()
            newItem.title = title
            
            self.itemArray.append(newItem)
            //self.defaults.set(self.itemArray, forKey: "TodoItems")
            self.tableView.reloadData()
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
   
   
}

