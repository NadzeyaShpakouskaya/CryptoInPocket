//
//  Double+Extension.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 15/12/2021.
//

import Foundation

extension Double {
    private static let suffix = ["", "K", "M", "B", "T", "P", "E"]

    public static func formatNumber(_ number: Double) -> String {
       var index = 0
       var value = number
       while value / 1000 >= 1 {
           value /= 1000
           index += 1
       }
       return String(format: "%.1f%@", value, suffix[index])
    }
}
