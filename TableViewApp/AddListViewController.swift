//
//  AddListViewController.swift
//  TableViewApp
//
//  Created by USER on 2023/08/28.
//

import UIKit

class AddListViewController: UIViewController {
    
    
    @IBOutlet weak var addTextField: UITextField!
    var taskArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //まずはUserDefaultsからすでに入力されているタスクをtaskArrayに読み込む
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: "add") != nil {
            taskArray = userDefaults.object(forKey: "add") as! [String]
        }
        
        // Do any additional setup after loading the view.
    }
    
    // TextFieldが未入力の状態の時はタスクを追加しないようにする。
    @IBAction func addTask(_ sender: Any) {
        if let newTask = addTextField.text, !newTask.isEmpty {
            let userDefaults = UserDefaults.standard
            taskArray.append(newTask)
            userDefaults.set(taskArray, forKey: "add")
            self.navigationController?.popViewController(animated: true)
        } else {
        }
    }
}
