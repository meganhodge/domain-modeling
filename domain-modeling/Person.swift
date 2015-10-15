//
//  Person.swift
//  domain-modeling
//
//  Created by iGuest on 10/13/15.
//  Copyright (c) 2015 Megan Hodge. All rights reserved.
//

import Foundation

class Person {
    var firstName : String
    var lastName : String
    var age : Int
    var job : Job?
    var spouse : Person?
    
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
        print("First Name: " + firstName)
        print("Last Name: " + lastName)
        print("Age: " + String(age))
        if job != nil {
            print("Job: " + job!.title)
        } else {
            print("Job: currently looking for one...")
        }
        if spouse != nil {
            print("Spouse: " + spouse!.firstName + " " + spouse!.lastName)
        } else {
            print("Spouse: woohoo I'm single")
        }
    }
}