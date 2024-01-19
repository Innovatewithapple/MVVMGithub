//
//  GithubProfileModel.swift
//  MVVMGithub
//
//  Created by Himanshu vyas on 19/01/24.
//

import UIKit

struct GithubProfileModel:Codable{
    let username:String
    let avatar:String
    let followers:Int
    let following:Int
    let repo:Int
    let privateRepo:Int
    let gists:Int
    let bio:String
    let collab:Int
    
    enum CodingKeys:String, CodingKey{
        case username = "login"
        case avatar = "avatar_url"
        case followers = "followers"
        case following = "following"
        case repo = "public_repos"
        case privateRepo = "owned_private_repos"
        case gists = "public_gists"
        case bio = "bio"
        case collab = "collaborators"
    }
}
