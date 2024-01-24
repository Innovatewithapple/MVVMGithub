//
//  GithubUserProfileModel.swift
//  MVVMGithub
//
//  Created by Himanshu vyas on 19/01/24.
//

import UIKit

final class GithubUserProfileViewModel{
    
    private var Profile: GithubProfileModel? = nil
    weak var delegate:GithubDelegates? 
    private var currentState:ViewStates?
    var username = ""
    
    // Callback to notify the View of changes, including the navigation title
    var viewModelUpdated: (() -> Void)?
    var navigationTitleColor: UIColor = .black
    var navigationTitle: String = ""
    var tableViewColor: UIColor = .black
    var cellBackgroundColor: UIColor = .black
    var navigationBarBackgroundColor: UIColor = .black
    var navigationBackButtonColor: UIColor = .blue
    var silverColor : UIColor = .gray
    
    func loadModel(){
        self.updateNavigationAndTableView()
        self.Profile = nil
        Services.sharedInstance.UserProfile(url:CompleteLink.PROFILE.rawValue+username, { profileResponse in
            self.currentState = .loading
            switch profileResponse{
            case .success(let data):
                self.Profile = data
                Constant.UserName = data.username
                self.currentState = .success
                self.delegate?.GetResponse(state: .success)
            case .failure(let err):
                self.Profile = nil
                self.currentState = .failure(err)
                Constant.UserName = ""
                self.delegate?.GetResponse(state: .failure(err))
            }
        })
    }
    
    func updateNavigationAndTableView(){
        navigationTitle = "Profile"
        navigationTitleColor = UIColor(hexString: Constant.BackgroundColor)
        tableViewColor = UIColor(hexString: Constant.BackgroundColor)
        navigationBarBackgroundColor = UIColor(hexString: Constant.ThemeColor)
        cellBackgroundColor = UIColor(hexString: Constant.CellBackgroundColor)
        navigationBackButtonColor = UIColor(hexString: Constant.backButtonColor)
        silverColor = UIColor(hexString: Constant.Silver)
        viewModelUpdated?()
    }
}

extension GithubUserProfileViewModel{
    func GetInformation() -> (username:String, bio:String, avatar:String, followers:String, following:String, gists:String, collab:String, privateRepo:String, repo:String){
        return(
            username: self.Profile?.username ?? "",
            bio: self.Profile?.bio ?? "",
            avatar: self.Profile?.avatar ?? "",
            followers: String(self.Profile?.followers ?? 0),
            following: String(self.Profile?.following ?? 0),
            gists: String(self.Profile?.gists ?? 0),
            collab: String(self.Profile?.collab ?? 0),
            privateRepo: String(self.Profile?.privateRepo ?? 0),
            repo: String(self.Profile?.repo ?? 0)
        )
    }
}
