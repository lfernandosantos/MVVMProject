//
//  User.swift
//  HelloMVVM
//
//  Created by Fernando on 17/07/2018.
//  Copyright © 2018 Fernando. All rights reserved.
//

import Foundation


class User {
    var firstName: String!
    var lastName: String!
    var email:String!
    var password: String!
    
    
    init(vm: RegistrationVM) {
        self.firstName = vm.firstName
        self.lastName = vm.lastName
        self.email = vm.email
        self.password = vm.password
    }
    
    init(firstName: String, lastName: String, email: String, password: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
    }
}
