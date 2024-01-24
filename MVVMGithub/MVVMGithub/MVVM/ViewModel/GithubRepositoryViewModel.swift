//
//  GithubRepositoryViewModel.swift
//  MVVMGithub
//
//  Created by Himanshu vyas on 20/01/24.
//

import UIKit

final class GithubRepositoryViewModel{
    
    private var RepoList:[RepoData]? = nil
    weak var delegate:GithubDelegates?
    private var currentState:ViewStates?
    var username = ""
    
    // Callback to notify the View of changes, including the navigation title
    var viewModelUpdated: (() -> Void)?
    var navigationTitleColor: UIColor = .black
    var navigationTitle: String = ""
    var tableViewColor: UIColor = .black
    var navigationBarBackgroundColor: UIColor = .black
    var navigationBackButtonColor:UIColor = .blue
    
    func loadModel(API:UserList){
        self.updateNavigationAndTableView()
        Services.sharedInstance.RepoList(url:username, apiType: API, { results in
            self.currentState = .loading
            switch results {
            case .success(let userData):
                self.RepoList = userData
                self.delegate?.GetResponse(state: .success)
            case .failure(let err):
                self.RepoList = nil
                self.delegate?.GetResponse(state: .failure(err))
                print(err)
            }
        })
    }
    
    func updateNavigationAndTableView(){
        navigationTitle = "Repository&Gists"
        navigationTitleColor = UIColor(hexString: Constant.BackgroundColor)
        tableViewColor = UIColor(hexString: Constant.BackgroundColor)
        navigationBarBackgroundColor = UIColor(hexString: Constant.ThemeColor)
        navigationBackButtonColor = UIColor(hexString: Constant.backButtonColor)
        viewModelUpdated?()
    }
}

extension GithubRepositoryViewModel{
    var numberOfItems:Int{
        RepoList?.count ?? 0
    }
    
    func getInfo(for indexPath:IndexPath) -> (name:String,avatar:String,desc:String){
        let users = RepoList?[indexPath.row]
        return (name:users?.name ?? "", avatar:users?.htmlURL ?? "",desc:users?.description ?? "  ")
    }
}

