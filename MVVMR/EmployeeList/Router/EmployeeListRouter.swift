//
//  EmployeeListModule.swift
//  MVVMR
//
//  Created by Kant, Lalit on 28/03/22.
//

import Foundation
import UIKit

/// Creating about Module to hold View controller
class EmployeeListModule {
    /// create About Module
    /// - Returns: FBAboutViewController
    func createModule() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let empVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        empVC.employeeViewModel.router = EmployeeListRouter()
        empVC.employeeViewModel.router?.viewController = empVC
        return empVC
    }
   
}

/// More Router Protocol
protocol EmployeeListRouterProtocol {
    func routeToEmployeeDetailScreen(empData: EmployeeData?)
}

/// Router to hold View controller of More tab and it can be extended to include data to hold and pass to other screens
class EmployeeListRouter {
    var viewController: UIViewController?
}

extension EmployeeListRouter: EmployeeListRouterProtocol {
    
    /// Route to about Screen
    func routeToEmployeeDetailScreen(empData: EmployeeData?) {
        let empDetail = EmployeeDetailModule().createModule()
        empDetail.employeeDetailViewModel.empData = empData
        viewController?.navigationController?.pushViewController(empDetail, animated: true)
    }

    
}
