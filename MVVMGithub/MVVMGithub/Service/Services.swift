//
//  Services.swift
//  MVVMGithub
//
//  Created by Himanshu vyas on 18/01/24.
//

import Foundation
import UIKit

final class Services{
  static let sharedInstance = Services()
    
    let APIURL = "https://api.github.com"
    
    func UsersList(_ completion:@escaping(Result<[UsersData], Error>) -> Void){
        guard let url = URL(string: APIURL+CompleteLink.USER.rawValue) else {
            completion(.failure(NSError(domain: "Url not working", code: 0)))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("Bearer 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", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let err = error {
                print(#function, "🧨 Error: \(String(describing: error))")
                completion(.failure(err))
            } else {
                guard let data = data else{
                    return
                }
                do {
                    let HandleData = try JSONDecoder().decode([UsersData].self, from: data)
                    print(#function, "📡 Data: \(String(describing: HandleData))")
                    completion(.success(HandleData))
                } catch {
                    print(#function, "🧨 Error on handle data: \(String(describing: error))")
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    //Handle UIImage URl using URLSession
    func HandleImage(imageURL:String,_ completion:@escaping(UIImage?) -> Void){
        guard let url = URL(string: imageURL) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let err = error {
                print(#function, "🧨 Error: \(String(describing: error))")
                completion(nil)
            }else {
                guard let data = data else{
                    return
                }
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        completion(image)
                    }
                } else {
                    print(#function, "🧨 Error: \(String(describing: error))")
                    completion(nil)
                }
            }
        }.resume()
    }
}

enum CompleteLink:String{
    case USER = "/users"
}
