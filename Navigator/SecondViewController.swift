//
//  SecondViewController.swift
//  Navigator
//
//  Created by Alexandra Gorshkova on 29/04/2019.
//  Copyright © 2019 Alexandra Gorshkova. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

  //  @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
   // var person : Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    var tbk = self.tabBarController as! TabBarViewController
       nameLabel.text = tbk.person?.name
        surnameLabel.text = tbk.person?.surname
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
