//
//  AddViewController.swift
//  petOne
//
//  Created by Владимир on 15.08.2023.
//

import UIKit

class AddViewController: UIViewController {

    //MARK: -Outlets
    @IBOutlet weak var mainTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var addButtonOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notifications()
        setDelegate(textField: mainTextField)
        setDelegate(textField: secondTextField)
    }
    
    //MARK: -Methods
    
    func setDelegate(textField: UITextField) {
        textField.delegate = self
    }
    
    
    func notifications() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (ns) in
            self.view.frame.origin.y = -200
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { (ns) in
            self.view.frame.origin.y = 0
        }
    }
    
    
    @IBAction func addButton(_ sender: UIButton) {
        if mainTextField.text == "" {
            createAlertReturn()
        } else {
            mainArray.append([mainTextField.text,secondTextField.text])
            createAlert(title: "Успех!", message: "Заметка добавлена")
        }
    }
    
    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "Хорошо, вернуться назад", style: .default) { action in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func createAlertReturn() {
        let alert = UIAlertController(title: "Ошибка!", message: "Введите заметку", preferredStyle: .alert)
        let action = UIAlertAction(title: "Хорошо", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

    //MARK: -Extension

extension AddViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.mainTextField.resignFirstResponder()
        self.secondTextField.resignFirstResponder()
        return true
    }
}
