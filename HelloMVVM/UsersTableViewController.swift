//
//  UsersTableViewController.swift
//  HelloMVVM
//
//  Created by Fernando on 17/07/2018.
//  Copyright © 2018 Fernando. All rights reserved.
//

import UIKit

class UsersTableViewController: UITableViewController {

    
    private var usersListVM: UsersListVM!
    private var dataAccess: DataAccess!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataAccess = DataAccess()
        self.usersListVM = UsersListVM(dataAccess: self.dataAccess)
    
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let userViewModel = self.usersListVM.usersVM[indexPath.row]
        
        cell.textLabel?.text = "\(userViewModel.firstName.value!) \(userViewModel.lastName.value!)"
        
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return usersListVM.usersVM.count
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  let registrationVC = segue.destination as? RegistrationTableViewController {
            let indexPath = (self.tableView.indexPathForSelectedRow)!
            
            let userVM = self.usersListVM.usersVM[indexPath.row]
            registrationVC.selectedUserVM = userVM
        }
    }

}
