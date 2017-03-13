//
//  SecondViewController.swift
//  BeProductive
//
//  Created by Nitish Dang on 2017-03-11.
//  Copyright © 2017 Nitish Dang. All rights reserved.
//

import UIKit
import RealmSwift
var tasks=List<ToDooo>()
class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var Tasktxt:UITextField?
    @IBOutlet var Priority:UITextField?
    let uiRealm = try! Realm()
        
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var date1=NSDate()
    //Button Click/Get data from text field
    @IBAction func btnAdd(sender: UIButton){
        let todoitem = ToDooo()
        todoitem.Task = (Tasktxt?.text)!
        todoitem.status=Int((Priority?.text)!)!
        counter += 1
        try! uiRealm.write { () -> Void in
            uiRealm.add(todoitem)
        }
    }
    
    //Keyboard goes away
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    //Keyboard goes away
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder();
        return true;
        
    }

}


