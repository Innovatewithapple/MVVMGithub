//
//  ViewController.swift
//  MVVMGithub
//
//  Created by Himanshu vyas on 18/01/24.
//

import UIKit

class ViewController: UIViewController, GithubDelegates {
     
    @IBOutlet weak var profileView:UIView!
    @IBOutlet weak var profileImageView:UIImageView!
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var bioLabel:UILabel!
    
    @IBOutlet weak var followersView:UIView!
    @IBOutlet weak var followersLbl:UILabel!
    
    @IBOutlet weak var followingView:UIView!
    @IBOutlet weak var followingLbl:UILabel!
    
    @IBOutlet weak var repoView: UIView!
    @IBOutlet weak var repoLbl: UILabel!
    
    @IBOutlet weak var privateRepoView: UIView!
    @IBOutlet weak var privateRepoLbl: UILabel!
    
    @IBOutlet weak var gistsView: UIView!
    @IBOutlet weak var gistsLbl: UILabel!
    
    @IBOutlet weak var collabView: UIView!
    @IBOutlet weak var collabLbl: UILabel!
    
    var viewModel = GithubUserProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       HandleUserInterface()
    }
    
    func GetResponse(state: ViewStates) {
        DispatchQueue.main.async {
            switch state{
            case .success:
                self.SetProfileData(info: self.viewModel.GetInformation())
            case .idle:
                break
            case .failure(_):
                print("Error found")
            case .loading:
                print("Loading....")
            }
        }
    }
}
