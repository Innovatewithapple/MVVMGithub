//
//  FollowersExtension.swift
//  MVVMGithub
//
//  Created by Himanshu vyas on 23/01/24.
//

import Foundation
import UIKit
//MARK: - Handle User-Interface
extension FollowersViewController{
    func HandleUserInterface() {
        HandleTableViewAndNavigation()
        
        switch self.APIType{
        case .followers, .following:
            viewModel.delegate = self
            viewModel.loadModel(API: self.APIType)
        case .repo:
            repoViewModel.delegate = self
            repoViewModel.loadModel(API: self.APIType)
        case.gists:
            repoViewModel.delegate = self
            repoViewModel.loadModel(API: self.APIType)
        }
    }
    
    func HandleTableViewAndNavigation() {
        self.tableView.registerCell(cellType: ImageTextTableViewCell.self)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        switch self.APIType{
        case .followers, .following:
            self.viewModel.viewModelUpdated = { [weak self] in
                self?.tableView.backgroundColor = self?.viewModel.tableViewColor
                self?.title = self?.viewModel.navigationTitle
                self?.navigationController?.navigationBar.prefersLargeTitles = false
                self?.navigationController?.navigationBar.barTintColor = self?.viewModel.navigationBarBackgroundColor
                self?.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: self?.viewModel.navigationTitleColor ]
                self?.navigationController?.navigationBar.tintColor = self?.viewModel.navigationBackButtonColor
                self?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
                self?.view.backgroundColor = self?.viewModel.navigationBarBackgroundColor
            }
        case .repo,.gists:
            self.repoViewModel.viewModelUpdated = { [weak self] in
                self?.tableView.backgroundColor = self?.repoViewModel.tableViewColor
                self?.title = self?.repoViewModel.navigationTitle
                self?.navigationController?.navigationBar.prefersLargeTitles = false
                self?.navigationController?.navigationBar.barTintColor = self?.repoViewModel.navigationBarBackgroundColor
                self?.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: self?.repoViewModel.navigationTitleColor ]
                self?.navigationController?.navigationBar.tintColor = self?.repoViewModel.navigationBackButtonColor
                self?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
                self?.view.backgroundColor = self?.repoViewModel.navigationBarBackgroundColor
            }
        }
    }
}
