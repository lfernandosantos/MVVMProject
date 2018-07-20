//
//  DataAccess.swift
//  HelloMVVM
//
//  Created by Fernando on 17/07/2018.
//  Copyright © 2018 Fernando. All rights reserved.
//

import Foundation

class DataAccess {
    func getAllUser() -> [User] {
        
        var users = [User]()
        
        users.append(User(firstName: "Fernando", lastName: "Santos", email: "lf.feranando@gmail.com", password: "12345"))
        users.append(User(firstName: "Teste nome", lastName: "Silva", email: "arere@gmail.com", password: "12345"))
        return users
    }
}
