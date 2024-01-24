//
//  FollowersViewController.swift
//  MVVMGithub
//
//  Created by Himanshu vyas on 19/01/24.
//

import UIKit
import SafariServices

class FollowersViewController: BaseViewController, GithubDelegates {
    
    @IBOutlet weak var tableView: UITableView!
    
    var APIType:UserList = .followers
    var viewModel = GithubFollowersFollowingViewModel()
    var repoViewModel = GithubRepositoryViewModel()

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
        switch self.APIType{
        case.followers,.following,.repo:
            return 80
        case .gists:
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch self.APIType{
        case .followers, .following:
            return viewModel.numberOfItems
        case .repo,.gists:
            return repoViewModel.numberOfItems
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: ImageTextTableViewCell.self, indexPath: indexPath)
        switch self.APIType{
        case .followers, .following:
            cell.configure(info: viewModel.getInfo(for: indexPath),APIType:.followers)
        case .repo:
            cell.configure(info: repoViewModel.getInfo(for: indexPath),APIType:.repo)
        case .gists:
            cell.configure(info: repoViewModel.getInfo(for: indexPath),APIType:.gists)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch self.APIType{
        case .followers, .following:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            let individualUser = viewModel.getInfo(for: indexPath)
            vc.viewModel.username = "s/\(individualUser.name)"
            self.navigationController?.pushViewController(vc, animated: true)
        case .repo,.gists:
            // Open the link in SafariViewController
            let individualRepo = repoViewModel.getInfo(for: indexPath)
            if let url = URL(string: individualRepo.avatar) {
                let safariViewController = SFSafariViewController(url: url)
                present(safariViewController, animated: true, completion: nil)
            }
        }
    }
}
