//
//  EmployeeDetailViewController.swift
//  MVVMR
//
//  Created by Kant, Lalit on 28/03/22.
//

import UIKit

class EmployeeDetailViewController: UIViewController {
  
    @IBOutlet weak var employeesIdLabel: UILabel!
    @IBOutlet weak var employeesNameLabel: UILabel!

    var employeeDetailViewModel = EmployeeDetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupEmployeeData()
        // Do any additional setup after loading the view.
    }
    
    func setupEmployeeData() {
        if let empID = employeeDetailViewModel.empData?.id {
            employeesIdLabel.text = String.init(format: "Employee ID: %d", empID)
        }
        employeesNameLabel.text = "Employee Name: \(employeeDetailViewModel.empData?.employee_name ?? "")"
    }

}
