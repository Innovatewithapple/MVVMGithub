//
//  ViewController.swift
//  MVVMArchitecture
//
//  Created by Himanshu vyas on 19/01/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableV:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableV.register(UINib(nibName: "TextTableViewCell", bundle: nil), forCellReuseIdentifier: "TextTableViewCell")
        tableV.delegate = self
        tableV.dataSource = self
    }


}

extension ViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableV.dequeueReusableCell(withIdentifier: "TextTableViewCell", for: indexPath) as! TextTableViewCell
        cell.lbl.text = "m"
        return cell
    }
}
