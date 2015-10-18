//
//  Family.swift
//  domain-modeling
//
//  Created by iGuest on 10/13/15.
//  Copyright (c) 2015 Megan Hodge. All rights reserved.
//

import Foundation

class Family : CustomStringConvertible {
    var members: [Person]
    var description: String {
        return ("\(members.description)")
    }
    
//    var description: String {
//        var stringOfMembers = "["
//        for member in members {
//            stringOfMembers.appendContentsOf(member.description + ", ")
//        }
//        return (stringOfMembers + "]")
//    }

    
    init(members: [Person]) {
        self.members = members
    }
    
    // calculates the total income by taking the hours worked and applying them to any family member who is hourly and then
    // totalIncome starts at 0 because they might not have any income
    func householdIncome(hoursWorked: Double) -> Double {
        var totalIncome: Double = 0.0
        for member in members {
            if member.job != nil {
                totalIncome += member.job!.calculateIncome(hoursWorked)
            }
        }
        return totalIncome
    }
    
    // returns the collection of members
    // if there is a member in the family that is over 21 then a new child of age 0 gets added
    // only one child gets added once we find the first person who is over 21
    func haveChild() -> [Person]{
        for member in members {
            if member.age > 21 {
                members.append(Person(firstName: "wittle", lastName: "baby", age: 0, job: nil, spouse: nil))
                return members
            }
        }
        return members
    }
}