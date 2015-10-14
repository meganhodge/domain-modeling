//
//  Job.swift
//  domain-modeling
//
//  Created by iGuest on 10/13/15.
//  Copyright (c) 2015 Megan Hodge. All rights reserved.
//

import Foundation

class Job {
    // takes in the title, salaryType (can be either perYear or perHour), and salaryAmount
    var title: String
    var salary: Salary
    
    enum Salary {
        case PerYear(Double)
        case PerHour(Double)
    }
    
    init(title: String, salary: Salary) {
        self.title = title
        self.salary = salary
    }
    
    func calculateIncome(hoursWorked: Double) -> Double {
        switch salary {
            case .PerHour(let amount): return amount * hoursWorked
            case .PerYear(let amount): return amount
        }
    }
    
    func raise(raise: Double) -> Double{
        switch salary {
            case .PerYear(let amount): return (amount * (raise / 100)) + amount
            case .PerHour(let amount): return (amount * (raise / 100)) + amount
        }
    }
}