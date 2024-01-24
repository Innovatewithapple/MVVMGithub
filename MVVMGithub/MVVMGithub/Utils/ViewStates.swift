//
//  ViewStates.swift
//  MVVMGithub
//
//  Created by Himanshu vyas on 18/01/24.
//

import Foundation

enum ViewStates{
    case idle
    case success
    case failure(Error)
    case loading
}

@objc enum UserList:Int{
    case followers
    case following
    case repo
    case gists
}

enum NetworkLayer{
    case serverError
    case ResponseNil
    case noInternet
    case customError(String)
    indirect case chainedError(NetworkLayer, NetworkLayer)
}

enum ViewStatus: CaseIterable{
    case idle
    case success
    case failure
    case loading
}
