//
//  Money.swift
//  domain-modeling
//
//  Created by iGuest on 10/13/15.
//  Copyright (c) 2015 Megan Hodge. All rights reserved.
//

import Foundation

struct Money {
    var amount : Double
    var currency : String
    
    // returns a money object with the converted amount using the newCurrency
    // if the conversion is not between USD, GBP, EUR, CAN then we return the money object with the original currency and amount (if the conversion cannot be done then we send back a money object with currency1 and the original amount)
    func convert(newCurrency: String) -> Money {
        var convertedMoney = Money(amount: self.amount, currency: newCurrency)
        switch self.currency {
        case "USD":
            if (newCurrency == "GBP") {
                convertedMoney.amount *= 0.5
            } else if (newCurrency == "EUR") {
                convertedMoney.amount *= 1.5
            } else if (newCurrency == "CAN") {
                convertedMoney.amount *= 1.25
            }
        case "GBP":
            if (newCurrency == "EUR") {
                convertedMoney.amount *= 3
            } else if (newCurrency == "CAN") {
                convertedMoney.amount *= 2.5
            }
        case "EUR":
            if (newCurrency == "CAN") {
                convertedMoney.amount *= (5/6)
            }
        default:
            convertedMoney.amount = self.amount
            convertedMoney.currency = self.currency
        }
        return convertedMoney
    }

    
    // takes two money objects
    // converts money1's amount into money2's currency
    // adds the currencies in a new money object and returns it
    func add(money2: Money) -> Money {
        var moneySum = Money(amount: Double(), currency: String())
        moneySum = self.convert(money2.currency)
        moneySum.amount += money2.amount
        return moneySum
    }
    
    // takes two money objects
    // converts money1's amount into money2's currency
    // subtracts the currencies in a new money object and returns it
    func sub(money2: Money) -> Money {
        var moneySum = Money(amount: Double(), currency: String())
        moneySum = self.convert(money2.currency)
        moneySum.amount -= money2.amount
        return moneySum
    }
}