//
//  MVVMR
//
//  Created by Kant, Lalit on 28/03/22.
//

import Foundation

// MARK: - Welcome
struct Employees: Decodable {
    let status: String
    let data: [EmployeeData]?
}

// MARK: - Datum
struct EmployeeData: Decodable {
    let id: Int
    let employee_name: String
}
