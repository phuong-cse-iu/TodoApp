//
//  ViewController.swift
//  TodoApp
//
//  Created by Tran Tuan Phuong on 5/5/17.
//  Copyright © 2017 Donio Foundation. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var listOfTask:[Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            listOfTask = try context.fetch(Task.fetchRequest())
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        } catch {
            print("Fetching failed.")
        }
        
        tableView.reloadData()
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfTask.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let task = listOfTask[indexPath.row]
        cell.textLabel?.text = task.name
        
        
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete {
            let taskToBeDeleted = listOfTask[indexPath.row]
            context.delete(taskToBeDeleted)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                listOfTask = try context.fetch(Task.fetchRequest())
            } catch {
                print("Fetching failed.")
            }
            
        }
        
        tableView.reloadData()
    }

}

