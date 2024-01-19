//
//  AppCoordinator.swift
//  MVVMGithub
//
//  Created by Himanshu vyas on 19/01/24.
//

import Foundation
import UIKit

class AppCoordinator{
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        // Instantiate your initial view controller and set it as the root view controller
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let yourViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let initialViewModel = GithubUsersViewModel()
        yourViewController.viewModel = initialViewModel
        yourViewController.tableView.registerCell(cellType: ImageTextTableViewCell.self)
        navigationController.setViewControllers([yourViewController], animated: false)
    }
}
