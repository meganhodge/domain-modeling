//
//  main.swift
//  domain-modeling
//
//  Created by iGuest on 10/13/15.
//  Copyright (c) 2015 Megan Hodge. All rights reserved.
//

import Foundation

// Tests for Money
var moneyUSD = Money(amount: 100, currency: "USD")
var moneyGBP = Money(amount: 100, currency: "GBP")
println(moneyUSD.convert("GBP").amount) // convert USD to GBP so $100 * .5 = $50
println(moneyUSD.add(moneyGBP).amount) // $100 USD + $100 GBP = $150 because .5 GSP = 1 USD

// Tests for Job
var jobBoy = Job(title: "engineer", salary: )

// Tests for Person
var girl = Person(firstName: "girl", lastName: "girly", age: 22, job: nil, spouse: nil)
girl.toString()
var boy = Person(firstName: "boy", lastName: "boyy", age: 22, job: jobBoy, spouse: girl)
boy.toString()

// Tests for Family
var family = Family(members: [girl, boy])
print(family.householdIncome())
print(family.haveChild())