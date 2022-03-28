//
//  ViewController.swift
//  MVVMR
//
//  Created by Kant, Lalit on 28/03/22.
//

import UIKit
import Combine
class ViewController: UIViewController, UITableViewDelegate {
    
    
    @IBOutlet weak var employeeTableView: UITableView!
    
    var employeeViewModel = EmployeeListViewModel()
    lazy var employeeListSubscriber = Set<AnyCancellable>()

    private var dataSource : EmployeeTableViewDataSource<EmployeeTableViewCell,EmployeeData>!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.employeeTableView.delegate = self
        callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate(){
        
        self.employeeViewModel.employeeListResponse
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] response in
                guard let weakSelf = self else { return }
                weakSelf.updateDataSource()
            }).store(in: &employeeListSubscriber)
    }
    
    func updateDataSource(){
        
        self.dataSource = EmployeeTableViewDataSource(cellIdentifier: "EmployeeTableViewCell", items: self.employeeViewModel.empData.data!, configureCell: { (cell, evm) in
            cell.employeeIdLabel.text = String(evm.id)
            cell.employeeNameLabel.text = evm.employee_name
        })
        
        DispatchQueue.main.async {
            self.employeeTableView.dataSource = self.dataSource
            self.employeeTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        employeeViewModel.navigateToEmployeeDetailScreen(index: indexPath.row)
    }
    
}

