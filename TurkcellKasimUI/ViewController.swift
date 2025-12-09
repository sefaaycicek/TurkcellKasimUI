//
//  ViewController.swift
//  TurkcellKasimUI
//
//  Created by Sefa Aycicek on 9.12.2025.
//

import UIKit

class ViewController: UIViewController {
    
    let countries = ["Türkiye", "Amerika Birleşik Devletleri", "Japonya", "İtalya", "Fransa"]
    let cities = ["İstanbul", "Ankara", "İzmir", "Bolu", "Kocaeli", "Antalya"]
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        countryTextField.inputView = pickerView
    }

    @IBAction func saveTapped(_ sender: UIButton) {
        self.view.endEditing(true) // klavyeyyi gizler
        btnSave.isSelected.toggle()
    }
}

extension ViewController : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let item = cities[row]
        countryTextField.text = item
        if component == 1 {
            countryTextField.resignFirstResponder()
        }
    }
}

extension ViewController : UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return countries.count
        }
        return cities.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return countries[row]
        }
        
        return cities[row]
    }
}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let tag = textField.tag
        if let nextInput = view.viewWithTag(tag + 1) {
            if nextInput is UITextField {
                nextInput.becomeFirstResponder()
            }
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
}

extension Int {
    func karesi() ->Int {
        return self * self
    }
}
