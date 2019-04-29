//
//  TabBarViewController.swift
//  Navigator
//
//  Created by Alexandra Gorshkova on 29/04/2019.
//  Copyright © 2019 Alexandra Gorshkova. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    var person : Person? = nil
    var personName = ""
    var personSur = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        person = Person(name: personName, surname: personSur)
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
