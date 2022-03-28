//
//  MVVMR
//
//  Created by Kant, Lalit on 28/03/22.
//

import Foundation
import Combine

class EmployeeListViewModel : NSObject {
    
    private var apiService : APIService!
    var router: EmployeeListRouter!
    
    private(set) var empData : Employees!
    
    lazy var employeeListResponse = PassthroughSubject<Any, Never>()

    override init() {
        super.init()
        self.apiService = APIService()
        callFuncToGetEmpData()
    }
    
    func callFuncToGetEmpData() {
        self.apiService.apiToGetEmployeeMockData { (empData) in
            self.empData = empData
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.employeeListResponse.send(true)
            }
        }
    }
    
    func navigateToEmployeeDetailScreen(index: Int) {
        if let data = self.empData.data?[index] {
            router.routeToEmployeeDetailScreen(empData: data)
        }
    }
}
