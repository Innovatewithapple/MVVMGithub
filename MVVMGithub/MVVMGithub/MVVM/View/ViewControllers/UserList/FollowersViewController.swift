//
//  FollowersViewController.swift
//  MVVMGithub
//
//  Created by Himanshu vyas on 19/01/24.
//

import UIKit

class FollowersViewController: UIViewController, GithubDelegates {
    
    @IBOutlet weak var tableView: UITableView!
    
    var APIType:UserList = .followers
    var viewModel = GithubFollowersFollowingViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.HandleUserInterface()
    }
    
    func GetResponse(state: ViewStates) {
        DispatchQueue.main.async {
            switch state{
            case .success:
                self.tableView.reloadData()
            case .idle:
                break
            case .failure(let err):
                print("error:\(err)")
            case .loading:
                print("Loading...")
            }
        }
    }
    
}

//MARK: - TableView
extension FollowersViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: ImageTextTableViewCell.self, indexPath: indexPath)
        cell.configure(info: viewModel.getInfo(for: indexPath))
        return cell
    }
}

//MARK: - Handle User-Interface
extension FollowersViewController{
    func HandleUserInterface() {
        HandleTableViewAndNavigation()
        viewModel.delegate = self
        viewModel.loadModel(API: self.APIType)
    }
    
    func HandleTableViewAndNavigation() {
        self.tableView.registerCell(cellType: ImageTextTableViewCell.self)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.viewModel.viewModelUpdated = { [weak self] in
            self?.tableView.backgroundColor = self?.viewModel.tableViewColor
            self?.title = self?.viewModel.navigationTitle
            self?.navigationController?.navigationBar.prefersLargeTitles = false
            self?.navigationController?.navigationBar.barTintColor = self?.viewModel.navigationBarBackgroundColor
            self?.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: self?.viewModel.navigationTitleColor ]
            self?.view.backgroundColor = self?.viewModel.navigationBarBackgroundColor
        }
    }
}
