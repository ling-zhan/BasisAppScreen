//
//  UserStorage.swift
//  BasisAppScreen
//
//  Created by Ling on 2021/7/14.
//

import SwiftUI

class UserStorage {
    static let shared = UserStorage()
    
    /* User */
    @AppStorage("token") var token = ""
}
