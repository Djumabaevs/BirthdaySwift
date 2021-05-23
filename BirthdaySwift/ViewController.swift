//
//  ViewController.swift
//  BirthdaySwift
//
//  Created by Bakyt Dzhumabaev on 23/5/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var birthdayText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirth = UserDefaults.standard.object(forKey: "birth")
        
        if let newName = storedName as? String {
            nameLabel.text = newName
        }
        if let newBirth = storedBirth as? String {
            birthdayLabel.text = newBirth
        }
    }

    @IBAction func saveButton(_ sender: Any) {
        UserDefaults.standard.set(nameText.text!, forKey: "name")
        UserDefaults.standard.set(birthdayText.text!, forKey: "birth")
        
        nameLabel.text = "Name: \(nameText.text!)"
        birthdayLabel.text = "Birthday: \(birthdayText.text!)"
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        let storedName2 = UserDefaults.standard.object(forKey: "name")
        let storedBirth2 = UserDefaults.standard.object(forKey: "birth")
        
        if(storedName2 as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name: "
        }
        if(storedBirth2 as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "birth")
            birthdayLabel.text = "Birthday: "
        }
    }
}

