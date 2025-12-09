//
//  ViewController.swift
//  TurkcellKasimUI
//
//  Created by Sefa Aycicek on 9.12.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func saveTapped(_ sender: UIButton) {
        self.view.endEditing(true) // klavyeyyi gizler
    }
    
}

