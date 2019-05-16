//
//  ViewController.swift
//  LatihanDataFlow
//
//  Created by Abdurrouf on 16/05/19.
//  Copyright © 2019 rrr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var fullnameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBAction func registerPressed(_ sender: Any) {
        if fullnameTextField.text == "" || phoneTextField.text == "" {
            let alert = UIAlertController(title: "Error", message: "Isi dulu kampret", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ashiappp", style: .cancel) { (uiaa) in
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: "toConfirmPage", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ConfirmViewController {
            destination.fullname = fullnameTextField.text
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fullnameTextField.delegate = self
        phoneTextField.delegate = self
    }

}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == fullnameTextField {
            phoneTextField.becomeFirstResponder()
        } else if textField == phoneTextField {
            textField.resignFirstResponder()
        }
        return true
    }
}
