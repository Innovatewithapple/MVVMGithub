//
//  ViewController.swift
//  MVVMGithub
//
//  Created by Himanshu vyas on 18/01/24.
//

import UIKit

class ViewController: BaseViewController, GithubDelegates {
     
    @IBOutlet weak var profileView:RoundedBorderView!
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
                self.showAlertWithTextField(title: "Alert!!!", message: "Please enter private key or visit Github Developer Settings to generate one.\nClick on Github", placeholder: "Enter Code...") { code in
                    self.saveAuthCode(code: code ?? "")
                    self.HandleUserInterface()
                }
            case .loading:
                print("Loading....")
            }
        }
    }
}
