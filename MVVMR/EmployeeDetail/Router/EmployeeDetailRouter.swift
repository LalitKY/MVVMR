//
//  EmployeeDetailRouter.swift
//  MVVMR
//
//  Created by Kant, Lalit on 28/03/22.
//

import Foundation
import UIKit

class EmployeeDetailModule {

    func createModule() -> EmployeeDetailViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let empDetailVC = storyboard.instantiateViewController(withIdentifier: "EmployeeDetailViewController") as! EmployeeDetailViewController
        empDetailVC.employeeDetailViewModel.router = EmployeeDetailRouter()
        empDetailVC.employeeDetailViewModel.router?.viewController = empDetailVC
        return empDetailVC
    }
}

protocol EmployeeDetailRouterProtocol {
    func navToNextScreen()
}

class EmployeeDetailRouter {
    var viewController: UIViewController?
}

extension EmployeeDetailRouter: EmployeeDetailRouterProtocol {
    
    func navToNextScreen() {    }
}
