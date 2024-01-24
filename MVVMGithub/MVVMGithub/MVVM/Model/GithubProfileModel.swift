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
    
    // Custom initializer to handle missing values
       init(from decoder: Decoder) throws {
           let container = try decoder.container(keyedBy: CodingKeys.self)

           // Provide default values or handle missing keys here
           username = try container.decode(String.self, forKey: .username)
           avatar = try container.decode(String.self, forKey: .avatar)
           followers = try container.decodeIfPresent(Int.self, forKey: .followers) ?? 0
           following = try container.decodeIfPresent(Int.self, forKey: .following) ?? 0
           repo = try container.decodeIfPresent(Int.self, forKey: .repo) ?? 0
           privateRepo = try container.decodeIfPresent(Int.self, forKey: .privateRepo) ?? 0
           gists = try container.decodeIfPresent(Int.self, forKey: .gists) ?? 0
           bio = try container.decodeIfPresent(String.self, forKey: .bio) ?? ""
           collab = try container.decodeIfPresent(Int.self, forKey: .collab) ?? 0
       }
}
