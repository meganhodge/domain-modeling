//
//  Person.swift
//  domain-modeling
//
//  Created by iGuest on 10/13/15.
//  Copyright (c) 2015 Megan Hodge. All rights reserved.
//

import Foundation

class Person: CustomStringConvertible {
    var firstName : String
    var lastName : String
    var age : Int
    var job : Job?
    var spouse : Person?
    var description: String {
        return String(self.toString())
    }
    
    // if the person is over 16 then they can have a job
    // if the person is over 18 then they can have a spouse
    // job and spouse are set to nil if the person does not meet the age requirements
    init(firstName : String, lastName : String, age : Int, job : Job?, spouse : Person?) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        if age >= 16 {
            self.job = job
        } else {
            self.job = nil
        }
        if age >= 18 {
            self.spouse = spouse
        } else {
            self.spouse = nil
        }
    }
    
    // prints the first name, last name, age, job title (if applicable), and spouse first and last name (if applicable)
    func toString() {
        var jobString : String
        var spouseString : String
        
        if job != nil {
            jobString = "Job: " + job!.title
        } else {
            jobString = "Job: currently looking for one..."
        }
        if spouse != nil {
            spouseString = "Spouse: " + spouse!.firstName + " " + spouse!.lastName
        } else {
            spouseString = "Spouse: woohoo I'm single"
        }
        print("First Name: \(firstName) Last Name: \(lastName) Age: \(String(age)) \(jobString) \(spouseString)")
    }
}