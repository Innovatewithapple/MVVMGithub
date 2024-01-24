//
//  BaseViewController.swift
//  MVVMGithub
//
//  Created by Himanshu vyas on 23/01/24.
//

import UIKit
import SafariServices

class BaseViewController: UIViewController {
    var tapCount = 0
    var userDefault = UserDefaults()
    
    // Add a long-press gesture recognizer to the view
    var longPressGesture = UILongPressGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Constant.GithubAuthCode = self.getAuthCode()
    }
    
    func saveAuthCode(code:String){
        self.userDefault.removeObject(forKey: "AuthCode")
        self.userDefault.set(code, forKey: "AuthCode")
        Constant.GithubAuthCode = code
    }
    
    func getAuthCode() -> String {
        return self.userDefault.string(forKey: "AuthCode") ?? ""
    }
    
    func showAlertWithTextField(title: String, message: String, placeholder: String, okActionHandler: @escaping (String?) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = placeholder
            textField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        }
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            let text = alertController.textFields?.first?.text
            okActionHandler(text)
        }
        okAction.isEnabled = false
        
        let cancelAction = UIAlertAction(title: "Github", style: .cancel){ _ in
            if let url = URL(string: "https://github.com/settings/apps") {
                let safariViewController = SFSafariViewController(url: url)
                self.present(safariViewController, animated: true, completion: nil)
            }
        }
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        guard let alertController = presentedViewController as? UIAlertController else {
            return
        }
        
        if let text = textField.text, !text.isEmpty {
            alertController.actions.first?.isEnabled = true
        } else {
            alertController.actions.first?.isEnabled = false
        }
    }
}
