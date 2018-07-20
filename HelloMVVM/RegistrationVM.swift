//
//  RegistrationVM.swift
//  HelloMVVM
//
//  Created by Fernando on 17/07/2018.
//  Copyright © 2018 Fernando. All rights reserved.
//

import Foundation

class Dynamic<T> {
    
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T? {
        didSet {
            listener?(value!)
        }
    }
    
    init(_ v: T) {
        value = v
    }
    
    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value!)
    }
}

class RegistrationVM: ViewModel  {
    
   var brokenRules: [BrokenRule] = [BrokenRule]()
    
    var firstName: String!
    var lastName: String!
    var email: String!
    var password: String!
    
    init(firstName: String, lastName: String, email: String, password: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
    }
    
    init() {}
    
    var isValid: Bool {
        get {
            self.brokenRules = [BrokenRule]()
            self.validate()
            return self.brokenRules.count == 0 ? true : false
        }
    }
    
    
    func save() {
        let user = User(vm: self)
    }
}

extension RegistrationVM {
    
    private func validate() {
        if email.isEmpty || email == nil {
            self.brokenRules.append(BrokenRule(propertyName: "email", message: "email is required! "))
        }
        if password.isEmpty || password == nil {
            self.brokenRules.append(BrokenRule(propertyName: "password", message: "Password is required! "))
        }
    }
}

struct BrokenRule {
    var propertyName: String
    var message: String
}

protocol ViewModel {
    var brokenRules: [BrokenRule] { get set}
    var isValid: Bool { mutating get}
}
