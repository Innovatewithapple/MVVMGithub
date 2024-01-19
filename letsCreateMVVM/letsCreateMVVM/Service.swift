//
//  Service.swift
//  letsCreateMVVM
//
//  Created by Himanshu vyas on 18/01/24.
//

import Foundation
struct GithubUserModel: Codable {
    let GithubUsersData: [UsersData]
}

struct UsersData:Codable {
    let avatarURL:String?
    let login:String?
    
    enum CodingKeys:String,CodingKey{
       case avatarURL = "avatar_url"
        case login
    }
}
