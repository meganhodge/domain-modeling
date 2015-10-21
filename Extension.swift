//
//  Extension.swift
//  domain-modeling
//
//  Created by Megan Hodge on 10/18/15.
//  Copyright © 2015 Megan Hodge. All rights reserved.
//

import Foundation

extension Double {
    var USD: Money { return Money(amount: self, currency: "USD") }
    var EUR: Money { return Money(amount: self, currency: "EUR") }
    var GBP: Money { return Money(amount: self, currency: "GBP") }
    var YEN: Money { return Money(amount: self, currency: "YEN") }
}