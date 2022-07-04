//
//  WelcomeViewController.swift
//  2.3(Log in)
//
//  Created by Boris Zitserman on 01.07.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
var name = ""
    
    @IBOutlet var username: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        username.text = "Welcome, \(name)!"

    }
}
