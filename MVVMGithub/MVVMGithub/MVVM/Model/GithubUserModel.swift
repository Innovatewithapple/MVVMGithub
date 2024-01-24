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
    let description:String
    
    enum CodingKeys:String,CodingKey{
        case name
        case htmlURL = "html_url"
        case description
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.htmlURL = try container.decodeIfPresent(String.self, forKey: .htmlURL) ?? ""
        self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
    }
}
