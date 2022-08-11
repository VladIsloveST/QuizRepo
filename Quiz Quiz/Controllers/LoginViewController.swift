//
//  LoginViewController.swift
//  Quiz Quiz
//
//  Created by Mac on 01.08.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.becomeFirstResponder()
        nameTextField.autocapitalizationType = .words
        surnameTextField.autocapitalizationType = .words
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? QuizViewController else {return}
        
        guard let nameText = nameTextField.text else {return}
        guard let surnameText = surnameTextField.text else {return}
        
        dvc.nameAndSurname = nameText + " " + surnameText
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func goToQuizVC(_ sender: Any) {
        
        guard let nameText = nameTextField.text else { return }
        guard let surnameText = surnameTextField.text else { return }
        
        if !nameText.isEmpty && !surnameText.isEmpty {
            performSegue(withIdentifier: "goToQuizVC", sender: nil)
            
        } else {
            nameTextField.placeholder = "Please write name"
            surnameTextField.placeholder = "Please write surname"
        }
    }
    
    @IBAction func unwindToContainerVC(segue: UIStoryboardSegue) {
        score = 0
        nameTextField.becomeFirstResponder()
        nameTextField.text = ""
        nameTextField.placeholder = ""
        surnameTextField.text = ""
    }
}
