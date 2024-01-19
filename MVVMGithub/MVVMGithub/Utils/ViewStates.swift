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
