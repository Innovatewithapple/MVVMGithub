//
//  GithubUsersViewModel.swift
//  MVVMGithub
//
//  Created by Himanshu vyas on 18/01/24.
//

import Foundation
import UIKit

final class GithubFollowersFollowingViewModel {
    
    private var UsersList:[UsersData]? = nil
    
    weak var delegate: GithubDelegates?
    weak var navDelegate: GithubNavigationdelegates?
    var username = "s/Innovatewithapple"
    private var currentState:ViewStates?
    
    // Callback to notify the View of changes, including the navigation title
    var viewModelUpdated: (() -> Void)?
    var navigationTitleColor: UIColor = .black
    var navigationTitle: String = ""
    var tableViewColor: UIColor = .black
    var navigationBarBackgroundColor: UIColor = .black
    var navigationBackButtonColor: UIColor = .blue
    
    func loadModel(API:UserList){
        self.updateNavigationAndTableView()
        self.UsersList = nil
        Services.sharedInstance.UsersList(url:username,apiType: API, { results in
            self.currentState = .loading
            switch results {
            case .success(let userData):
                self.UsersList = userData
                self.delegate?.GetResponse(state: .success)
            case .failure(let err):
                self.UsersList = nil
                self.delegate?.GetResponse(state: .failure(err))
                print(err)
            }
        })
    }
    
    func updateNavigationAndTableView(){
        navigationTitle = "Github Users"
        navigationTitleColor = UIColor(hexString: Constant.BackgroundColor)
        tableViewColor = UIColor(hexString: Constant.BackgroundColor)
        navigationBarBackgroundColor = UIColor(hexString: Constant.ThemeColor)
        navigationBackButtonColor = UIColor(hexString: Constant.backButtonColor)
        viewModelUpdated?()
    }
}

extension GithubFollowersFollowingViewModel{
    var numberOfItems:Int{
        UsersList?.count ?? 0
    }
    
    func getInfo(for indexPath:IndexPath) -> (name:String,avatar:String,desc:String){
        let users = UsersList?[indexPath.row]
        return (name:users?.login ?? "", avatar:users?.avatarURL ?? "",desc:"")
    }
}
