//  MVVMR
//
//  Created by Kant, Lalit on 28/03/22.
//

import Foundation

class APIService :  NSObject {
    
    func apiToGetEmployeeMockData(completion : @escaping (Employees) -> ()) {
        let decoder = JSONDecoder()
        guard let pathString = Bundle(for: type(of: self)).path(forResource: "EmployeeData", ofType: "json")        else {
            fatalError("EmployeeData.json not found")
        }
        guard let jsonString = try? String(contentsOfFile: pathString, encoding: .utf8) else {
            fatalError("Unable to convert EmployeeData.json to String")
        }
        guard let jsonData = jsonString.data(using: .utf8),
              let serviceCasesResponse = try? decoder.decode(Employees.self, from: jsonData) else {
            fatalError("Unable to convert EmployeeData.json to Data")
        }
        completion(serviceCasesResponse)
    }
    
}
