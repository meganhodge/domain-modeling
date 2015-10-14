//
//  Family.swift
//  domain-modeling
//
//  Created by iGuest on 10/13/15.
//  Copyright (c) 2015 Megan Hodge. All rights reserved.
//

import Foundation

class Family {
    var members: [Person]
    
    init(members: [Person]) {
        self.members = members
    }
    
    func householdIncome() -> Double {
        var totalIncome: Double = 0.0
        for member in members {
            totalIncome += member.job!.salary
        }
        return totalIncome
    }
    
    // returns the collection of members
    // if there is a member in the family that is over 21 then a new child of age 0 gets added
    func haveChild() -> [Person]{
        for member in members {
            if member.age > 21 {
                members.append(Person(firstName: String(), lastName: String(), age: 0, job: nil, spouse: nil))
            }
        }
        return members
    }
}