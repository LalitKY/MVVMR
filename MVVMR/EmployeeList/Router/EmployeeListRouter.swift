//
//  EmployeeListModule.swift
//  MVVMR
//
//  Created by Kant, Lalit on 28/03/22.
//

import Foundation
import UIKit

/// Employee list module is to create instance of view controller and initiating view controller in view model router
class EmployeeListModule {
    
    func createModule() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let empVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        empVC.employeeViewModel.router = EmployeeListRouter()
        empVC.employeeViewModel.router?.viewController = empVC
        return empVC
    }
}

class EmployeeListRouter {
    var viewController: UIViewController?
}

protocol EmployeeListRouterProtocol {
    func routeToEmployeeDetailScreen(empData: EmployeeData?)
}

extension EmployeeListRouter: EmployeeListRouterProtocol {
    
    func routeToEmployeeDetailScreen(empData: EmployeeData?) {
        let empDetail = EmployeeDetailModule().createModule()
        empDetail.employeeDetailViewModel.empData = empData
        viewController?.navigationController?.pushViewController(empDetail, animated: true)
    }
}
