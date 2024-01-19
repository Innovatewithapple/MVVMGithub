//
//  GithubUserModel.swift
//  MVVMGithub
//
//  Created by Himanshu vyas on 18/01/24.
//

import UIKit


struct UsersData:Codable {
    let avatarURL:String?
    let login:String?
    
    enum CodingKeys:String,CodingKey{
       case avatarURL = "avatar_url"
       case login
    }
}
