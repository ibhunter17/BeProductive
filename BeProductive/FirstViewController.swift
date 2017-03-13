//
//  FirstViewController.swift
//  BeProductive
//
//  Created by Nitish Dang on 2017-03-11.
//  Copyright © 2017 Nitish Dang. All rights reserved.
//

import UIKit
import RealmSwift
import Realm


var counter:Int=0

class FirstViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    let searchController = UISearchController(searchResultsController: nil)
    
    
    @IBOutlet var tblTasks : UITableView!
    let uiRealm = try! Realm()
    override func viewDidLoad() {
        
        

         tblTasks.reloadData()
        tblTasks.estimatedRowHeight=70
      tblTasks.rowHeight = UITableViewAutomaticDimension
            }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var list : Results<ToDooo>!
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list=uiRealm.objects(ToDooo.self)
        return list.count
    }

    
   

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell: UITableViewCell=UITableViewCell(style:UITableViewCellStyle.subtitle, reuseIdentifier:"Default")
        let taskmanagerlist=list[indexPath.row]
        cell.textLabel?.numberOfLines = 0;
        let todayDate = taskmanagerlist.date
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "dd-MMM-yyyy"
        let dateInStringWithRequiredFormat = formatter1.string(from: todayDate as Date)
        cell.textLabel?.text = taskmanagerlist.Task
        cell.detailTextLabel?.text=dateInStringWithRequiredFormat
        return cell
    }
    

    //Updates List
    
    override func viewWillAppear(_ animated: Bool) {
            tblTasks.reloadData();
    }
    
  
    
    //Deletes and updates rows
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        
        if (editingStyle == .delete){
            let rowdescr = list[indexPath.row]
            try! self.uiRealm.write({
                self.uiRealm.delete(rowdescr)
            })
            
            tableView.deleteRows(at:[indexPath], with: .automatic)
            counter -= 1
        }
        
        

     
}
    
       //Edits and creates alert box
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "Edit",
                                      message: "Edit your Tasks here",
                                      preferredStyle: .alert)

        let loginAction = UIAlertAction(title: "Submit", style: .default, handler: { (action) -> Void in
            var usernameTxt = alert.textFields![0]
            
            
            if (usernameTxt.text != nil) {
                try! self.uiRealm.write({
                    self.list[indexPath.row].Task=usernameTxt.text!
                })
                self.tblTasks.reloadData()
            }
            
            else{self.list[indexPath.row].Task=self.list[indexPath.row].Task}

        })
        
         let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) -> Void in })
        alert.addTextField { (textField: UITextField) in
            textField.keyboardAppearance = .dark
            textField.keyboardType = .default
            textField.autocorrectionType = .default
            textField.placeholder = "Type your username"
            textField.textColor = UIColor.black
        }
        
        alert.addAction(loginAction)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
        
    



}
    @IBAction func btnSortDate(sender: UIButton){
        var e11:Int=0;
        var e:Int=list.count
        
        while(e11 <= e) {
            
            let todoitem = ToDooo()
            todoitem.Task = list[e11].Task
            todoitem.status=list[e11].status
            try! uiRealm.write { () -> Void in
                uiRealm.add(todoitem)
            }
           e11 += 1
        
        }
        //self.list = self.list.sorted(byKeyPath:"status", ascending:false)
        tblTasks.reloadData()
    }
        

        
        
    

    
    @IBAction func btnSortPriority(sender: UIButton){
        
    }



}
