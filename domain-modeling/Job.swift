//
//  Job.swift
//  domain-modeling
//
//  Created by iGuest on 10/13/15.
//  Copyright (c) 2015 Megan Hodge. All rights reserved.
//

import Foundation

class Job {
    var title: String
    var salary: Salary
    
    enum Salary: Double {
        case PerYear(Double)
        case PerHour(Double)
    }
    
    init(title: String, salary: Salary) {
        self.title = title
        self.salary = salary
    }
    
    func calculateIncome(hoursWorked: Double) -> Double {
        if (Salary.PerYear == salary) {
            return salary
        } else {
            return hoursWorked * salary
    }
    
    func raise(raise: Double) -> Double{
        return salary.rawValue * raise * 100.00
    }
}