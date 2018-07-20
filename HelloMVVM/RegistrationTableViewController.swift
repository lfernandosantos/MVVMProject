//
//  RegistrationTableViewController.swift
//  HelloMVVM
//
//  Created by Fernando on 17/07/2018.
//  Copyright © 2018 Fernando. All rights reserved.
//

import UIKit

class RegistrationTableViewController: UITableViewController {

    @IBOutlet weak var TFfirstName: BindingTextBox! {
        didSet {
            TFfirstName.bind { self.registrationVM.firstName = $0 }
        }
    }
    
    @IBOutlet weak var TFLastName: BindingTextBox! {
        didSet {
            TFLastName.bind { self.registrationVM.lastName = $0 }
        }
    }
    
    @IBOutlet weak var TFEmail: UITextField!
    @IBOutlet weak var TFPassword: UITextField!
    
    private var registrationVM: RegistrationVM!
    var selectedUserVM: UserViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.selectedUserVM.firstName.bind {
            self.TFfirstName.text = $0
        }
        
        self.selectedUserVM.lastName.bind {
            self.TFLastName.text = $0
        }
        
       // registrationVM = RegistrationVM()
        //TFfirstName.text = self.selectedUserVM.firstName
        //TFLastName.text = self.selectedUserVM.lastName
        


    }


    @IBAction func save(_ sender: Any) {
        
        if self.registrationVM.isValid {
            print("OK")
        } else {
            print(self.registrationVM.brokenRules)
        }
        self.selectedUserVM.lastName.value = "Martins do Funciona Binding"
        
        
    }
    

}
