//
//  AddTaskVC.swift
//  TodoApp
//
//  Created by Tran Tuan Phuong on 5/5/17.
//  Copyright © 2017 Donio Foundation. All rights reserved.
//

import UIKit

class AddTaskVC: UIViewController {

    @IBOutlet weak var isImportant: UISwitch!
    @IBOutlet weak var txtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTask(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        task.name = txtField.text
        task.isImportant = isImportant.isOn
    
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        self.navigationController?.popViewController(animated: true)
    }


}
