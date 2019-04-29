//
//  ViewController.swift
//  Navigator
//
//  Created by Alexandra Gorshkova on 23/04/2019.
//  Copyright © 2019 Alexandra Gorshkova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var surname: UITextField!
    

    var person = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
    }
    
  

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "go") {
            
            let destination : TabBarViewController = segue.destination as! TabBarViewController
            destination.personName = name.text ?? ""
            destination.personSur = surname.text ?? ""
        
        }
    }

}
//ключ API
// AIzaSyCFEvF5dufFq3tv4nKmR6FIwwEdxIr9IB4

