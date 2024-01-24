//
//  ErrorModel.swift
//  MVVMGithub
//
//  Created by Himanshu vyas on 23/01/24.
//

import Foundation

struct ErrorModel:Codable{
    let message:String
    let documentationURL:String
    
    enum CodingKeys:String,CodingKey{
        case message
        case documentationURL = "documentation_url"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try container.decodeIfPresent(String.self, forKey: .message) ?? "Please Try Again Later!!!"
        self.documentationURL = try container.decodeIfPresent(String.self, forKey: .documentationURL) ?? ""
    }
}
