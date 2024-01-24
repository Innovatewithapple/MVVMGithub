//
//  ProfileExtension.swift
//  MVVMGithub
//
//  Created by Himanshu vyas on 19/01/24.
//

import UIKit

//MARK: - Handle User-Interface
extension ViewController{
    func HandleUserInterface() {
        HandleTableViewAndNavigation()
        viewModel.delegate = self
        viewModel.loadModel()
        setupViewActions()
    }
    
    func setupViewActions() {
        // Add a tap gesture recognizer to the UIView
        let followersTapGesture = UITapGestureRecognizer(target: self, action: #selector(followersAction))
        self.followersView.addGestureRecognizer(followersTapGesture)
        let followingTapGesture = UITapGestureRecognizer(target: self, action: #selector(followingAction))
        self.followingView.addGestureRecognizer(followingTapGesture)
        let repoTapGesture = UITapGestureRecognizer(target: self, action: #selector(repoAction))
        self.repoView.addGestureRecognizer(repoTapGesture)
        let gistsTapGesture = UITapGestureRecognizer(target: self, action: #selector(gistsAction))
        self.gistsView.addGestureRecognizer(gistsTapGesture)
        let pRepoTapGesture = UITapGestureRecognizer(target: self, action: #selector(privateRepoAction))
        self.privateRepoView.addGestureRecognizer(pRepoTapGesture)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        // Set the number of taps required (5 in this case)
        self.collabView.addGestureRecognizer(tapGesture)
    }
    
    @objc func followersAction(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "FollowersViewController") as! FollowersViewController
        vc.APIType = .followers
        let getUsername = self.viewModel.GetInformation()
        vc.viewModel.username = "/users/\(getUsername.username)"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func followingAction(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "FollowersViewController") as! FollowersViewController
        vc.APIType = .following
        let getUsername = self.viewModel.GetInformation()
        vc.viewModel.username = "/users/\(getUsername.username)"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func repoAction(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "FollowersViewController") as! FollowersViewController
        vc.APIType = .repo
        let getUsername = self.viewModel.GetInformation()
        vc.repoViewModel.username = "/users/\(getUsername.username)"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func gistsAction(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "FollowersViewController") as! FollowersViewController
        vc.APIType = .gists
        let getUsername = self.viewModel.GetInformation()
        vc.repoViewModel.username = "/users/\(getUsername.username)"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func privateRepoAction(){
        
    }
    @objc func collabAction(){
       
    }
    
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        if self.tapCount >= 5{
            self.tapCount = 0
            self.showAlertWithTextField(title: "Alert!!!", message: "Please enter private key or visit Github Developer Settings to generate one.\nClick on Github", placeholder: "Enter Code...") { code in
                self.saveAuthCode(code: code ?? "")
                self.HandleUserInterface()
                print("Long press ended")
            }
        } else {
            self.tapCount += 1
            print("count:-\(self.tapCount)")
        }
    }
    
    func HandleTableViewAndNavigation() {
        self.viewModel.viewModelUpdated = { [weak self] in
            self?.title = self?.viewModel.navigationTitle
            self?.navigationController?.navigationBar.prefersLargeTitles = false
            self?.navigationController?.navigationBar.barTintColor = self?.viewModel.navigationBarBackgroundColor
            self?.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: self?.viewModel.navigationBarBackgroundColor ]
            self?.navigationController?.navigationBar.tintColor = self?.viewModel.navigationBackButtonColor
            self?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            self?.view.backgroundColor = self?.viewModel.cellBackgroundColor
            
            //Text
            self?.nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            self?.bioLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            self?.bioLabel.textColor = self?.viewModel.silverColor
            self?.nameLabel.textColor = self?.viewModel.navigationBarBackgroundColor
            
            [self?.followersLbl,self?.followingLbl,self?.gistsLbl,self?.privateRepoLbl,self?.repoLbl,self?.collabLbl].forEach{
                $0?.textAlignment = .center
                $0?.numberOfLines = 0 // Set the desired number of lines, use 0 for unlimited lines
            }
        }
        //Setup Colors
        let randomColors = Constant().SixColors()
        let cornerRadius: CGFloat = (self.followersView?.bounds.width ?? 0) / 2 - 5
        for (index, view) in [followersView, followingView, repoView, gistsView, privateRepoView, collabView].enumerated() {
            guard let currentView = view else { continue }
            // Apply random background color
            currentView.backgroundColor = .clear
            // Apply specified border color
            currentView.addRoundedCorners(radius: cornerRadius, borderWidth: 5, borderColor: randomColors[index])
        }
        
        for (index, view) in [followersLbl, followingLbl, repoLbl, gistsLbl, privateRepoLbl, collabLbl].enumerated() {
            guard let currentView = view else { continue }
            // Apply random background color
            currentView.backgroundColor = .clear
            // Apply specified border color
            currentView.textColor = randomColors[index]
        }
    }
    
    func SetupLabels() {
        self.viewModel.viewModelUpdated = { [weak self] in
            //Text
            self?.nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            self?.bioLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            self?.bioLabel.textColor = self?.viewModel.silverColor
            self?.nameLabel.textColor = self?.viewModel.navigationBarBackgroundColor
            
            [self?.followersLbl,self?.followingLbl,self?.gistsLbl,self?.privateRepoLbl,self?.repoLbl,self?.collabLbl].forEach{
                $0?.textAlignment = .center
                $0?.numberOfLines = 0 // Set the desired number of lines, use 0 for unlimited lines
            }
        }
    }
    
    func SetProfileData(info:(username:String, bio:String, avatar:String, followers:String, following:String, gists:String, collab:String, privateRepo:String, repo:String)){
        Services.sharedInstance.HandleImage(imageURL: info.avatar) { image in
            if let image = image{
                self.profileImageView.image = image
//                self.profileView.addRoundedCorners(radius: 60, borderWidth: 5, borderColor: UIColor(hexString: Constant.ThemeColor))
//                self.profileImageView.addRoundedCorners(radius: 60, borderWidth: 0, borderColor: UIColor.clear)
                self.profileView.borderColor = UIColor(hexString: Constant.ThemeColor)
                self.profileView.borderWidth = 5
                self.profileView.cornerRadius = 60
            }
        }
        
        self.bioLabel.text = info.bio
        self.nameLabel.text = info.username.uppercased()
        self.collabLbl.setAttributedText(firstPart: info.collab, secondPart: "\nCollab")
        self.followersLbl.setAttributedText(firstPart: info.followers, secondPart: "\nFollowers")
        self.followingLbl.setAttributedText(firstPart: info.following, secondPart: "\nFollowing")
        self.gistsLbl.setAttributedText(firstPart: info.gists, secondPart: "\nGists")
        self.privateRepoLbl.setAttributedText(firstPart: info.privateRepo, secondPart: "\nP-Repo")
        self.repoLbl.setAttributedText(firstPart: info.repo, secondPart: "\nRepo")
    }
}
