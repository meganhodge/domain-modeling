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
print(moneyUSD.convert("GBP").amount) // convert USD to GBP so $100 * .5 = $50
print(moneyUSD.add(moneyGBP).amount) // $100 USD (converts to $50 GBP) + $100 GBP = $150 because .5 GSP = 1 USD
print(moneyUSD.sub(moneyGBP).amount) // $100 USD (converts to $50 GBP) - $100 GBP = -$50 because .5 GSP = 1 USD

// Tests for Job
var jobBoy = Job(title: "engineer", salary: .PerYear(100.00)) // salary is $100/year
var jobGirl = Job(title: "president", salary: .PerHour(65.00)) // gets $65/hour
print(jobBoy.calculateIncome(10)) // should be 100.00 since he is per year
print(jobBoy.raise(10)) // raise of 10% should print
print(jobGirl.calculateIncome(100))


// Tests for Person
var girl = Person(firstName: "girl", lastName: "girly", age: 22, job: jobGirl, spouse: nil)
girl.toString()
print("")
var boy = Person(firstName: "boy", lastName: "boyy", age: 22, job: jobBoy, spouse: girl)
boy.toString()
print("")

// Tests for Family
var family = Family(members: [girl, boy]) // girl has 65/hour, boy has 100.00/year
print(family.householdIncome(2000)) // 65*2000 = 130000.00 then + 100.00 = 130100.0
print(family.members.count) // should show count of 2
print(family.haveChild().count) // should show count of 3 because of haveChild()