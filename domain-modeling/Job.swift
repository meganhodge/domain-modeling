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
    
    // calculate the income based off of hourly or yearly pay
    // if they are yearly then their salary is returned and if they are hourly then their income is calculated using their salary amount times their hours worked
    func calculateIncome(hoursWorked: Double) -> Double {
        switch salary {
            case .PerHour(let amount): return amount * hoursWorked
            case .PerYear(let amount): return amount
        }
    }
    
    // the raise passed in is assumed to be a percent (ex. 10 is 10%) so this converts raise into a decimal
    // it returns the new salary with the raise so it adds the raise to the salary to return that amount
    func raise(raise: Double) -> Double{
        switch salary {
            case .PerYear(let amount): return (amount * (raise / 100)) + amount
            case .PerHour(let amount): return (amount * (raise / 100)) + amount
        }
    }
}