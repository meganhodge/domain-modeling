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
    
    init(firstName : String, lastName : String, age : Int, job : Job?, spouse : Person?) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        if age >= 18 {
            self.job = job
            self.spouse = spouse
        } else if age >= 16 {
            self.job = job
            self.spouse = nil
        } else {
            self.job = nil
            self.spouse = nil
        }
    }
    
    func toString() {
        print("First Name: " + firstName, terminator: "")
        print("Last Name: " + lastName, terminator: "")
        print("Age: " + String(age), terminator: "")
        if job != nil {
            print("Job: " + job!.title, terminator: "")
        } else {
            print("Job: currently looking for one...", terminator: "")
        }
        if spouse != nil {
            print("Spouse: " + spouse!.firstName + " " + spouse!.lastName, terminator: "")
        } else {
            print("Spouse: woohoo I'm single", terminator: "")
        }
    }
}