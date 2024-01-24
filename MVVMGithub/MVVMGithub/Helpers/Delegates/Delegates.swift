//
//  Delegates.swift
//  MVVMGithub
//
//  Created by Himanshu vyas on 18/01/24.
//

import Foundation

protocol GithubDelegates:AnyObject {
    func GetResponse(state:ViewStates)
}

protocol GithubNavigationdelegates:AnyObject{
    func NavigateResponse(state:ViewStates)
}

