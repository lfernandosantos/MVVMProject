//
//  UsersListVM.swift
//  HelloMVVM
//
//  Created by Fernando on 17/07/2018.
//  Copyright © 2018 Fernando. All rights reserved.
//

import Foundation

class UsersListVM {
    var usersVM: [UserViewModel] = [UserViewModel] ()
    
    private var dataAccess: DataAccess
    
    init(dataAccess: DataAccess) {
        self.dataAccess = dataAccess
        
        populateUsers()
    }
    
    private func populateUsers() {
        let users = self.dataAccess.getAllUser()
        
        self.usersVM = users.map { user in
            return UserViewModel(user: user)
        }
    }
}

class UserViewModel {
    
    var firstName: Dynamic<String>!
    var lastName: Dynamic<String>!
    
    init(user: User) {
        self.firstName = Dynamic<String>(user.firstName)
        self.lastName = Dynamic<String>(user.lastName)
    }
    
}
