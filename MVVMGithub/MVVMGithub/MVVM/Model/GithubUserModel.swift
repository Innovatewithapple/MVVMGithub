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


struct RepoData:Codable{
    let name:String
    let htmlURL:String
    
    enum CodingKeys:String,CodingKey{
        case name
        case htmlURL = "html_url"
    }
}
