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
print("Money tests")
print(moneyUSD.convert("GBP").amount) // convert USD to GBP so $100 * .5 = $50
print(moneyUSD.add(moneyGBP).amount) // $100 USD (converts to $50 GBP) + $100 GBP = $150 because .5 GSP = 1 USD
print(moneyUSD.sub(moneyGBP).amount) // $100 USD (converts to $50 GBP) - $100 GBP = -$50 because .5 GSP = 1 USD


// Tests for Job
var jobGirl = Job(title: "engineer", salary: .PerYear(100.00)) // salary is $100/year
var jobBoy = Job(title: "president", salary: .PerHour(65.00)) // gets $65/hour
print("Job tests")
print(jobGirl.calculateIncome(10)) // should be 100.00 since he is per year
print(jobGirl.raise(10)) // raise of 10% should print
print(jobBoy.calculateIncome(100))


// Tests for Person
print("Person tests")
var girl = Person(firstName: "girl", lastName: "girly", age: 22, job: jobGirl, spouse: nil)
girl.toString()
var boy = Person(firstName: "boy", lastName: "boyy", age: 22, job: jobBoy, spouse: girl)
boy.toString()
var noMoney = Person(firstName: "no", lastName: "money", age: 2, job: nil, spouse: nil)

// Tests for Family
var family = Family(members: [girl, boy]) // girl has 65/hour, boy has 100.00/year
// 2000 hours passed in because assuming they work full time if hourly
print("Family tests")
print(family.householdIncome(2000)) // 65*2000 = 130000.00 then + 100.00 = 130100.0
print(family.members.count) // should show count of 2
print(family.haveChild().count) // should show count of 3 because of haveChild()
var familyBroke = Family(members: [noMoney])
print(familyBroke.householdIncome(2000)) // family has 0.0 householdIncome because they have no job


// Protocol Tests
// tests protocol CustomStringConvertible
print("Protocol tests")
print("Money protocol")
print(moneyUSD.description) // should print USD100.0
print(moneyUSD.convert(moneyGBP.currency).description) // should print GBP50.0
print("Job protocol")
print(jobGirl.description)
print("Person protocol")
print(girl.description)
print("Family protocol")
print(family.description)

// Extension Test
print("Extension tests")
print(1.0.GBP)
// Convert using extension
print(299.9.USD.convert("EUR")) // converts to USD to EUR
print(53.8.EUR.sub(53.8.EUR)) // subtracts two EUR Moneys
print(53.8.EUR)
