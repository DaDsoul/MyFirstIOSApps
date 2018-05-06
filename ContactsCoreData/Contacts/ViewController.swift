//
//  ViewController.swift
//  Contacts
//
//  Created by Zhanserik on 6/26/17.
//  Copyright © 2017 Kenes Inc. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var personList: [Person] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        fetchPersons()
    }
    
    @IBAction func addPerson(_ sender: UIBarButtonItem) {
        
        let alertController = UIAlertController(title: "Add new contact", message: nil, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
            alertController.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(cancelAction)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Phone"
        }
        
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (action) in
            guard let nameTextField = alertController.textFields?.first,
            let phoneTextField = alertController.textFields?[1] else{
                return
            }
            let text = nameTextField.text
            let phone = phoneTextField.text
            
            self.addPerson(name: text!, phone: phone!)
        }
        
        alertController.addAction(addAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.personList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseidentifier")
        let person = self.personList[indexPath.row]
        cell?.textLabel?.text = person.name
        cell?.detailTextLabel?.text = person.phone
        return cell!
    }
}

extension ViewController {
    
    func addPerson(name: String, phone: String) {
        
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let context = delegate.persistentContainer.viewContext
        let person = Person(context: context)
        person.name = name
        person.phone = phone
        
        do {
            try context.save()
            fetchPersons()
        }
        catch let error {
            print(error.localizedDescription)
        }
    }
    
    func fetchPersons() {
        
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let context = delegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSManagedObject>(entityName: "Person")
        
        do {
            let persons = try context.fetch(request)
            self.personList = persons as! [Person]
            tableView.reloadData()
        }catch let error {
            print(error.localizedDescription)
        }
        
    }
    
}

