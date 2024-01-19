//
//  ViewController.swift
//  letsCreateMVVM
//
//  Created by Himanshu vyas on 18/01/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("letcheck")
        Services.sharedInstance.UsersList { [weak self] results in
            switch results{
            case .success(let data):
                print(data)
            case .failure(let err):
                print(err)
            }
        }
    }


}

