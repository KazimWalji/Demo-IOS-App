//
//  ViewController.swift
//  DemoSimplexApps
//
//  Created by Kazim Walji on 1/10/20.
//  Copyright © 2020 HenryKazim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var signUp: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Utilities.styleFilledButton(login)
        Utilities.styleFilledButton(signUp)
    }

}
