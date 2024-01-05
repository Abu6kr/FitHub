//
//  Double.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 05.01.2024.
//

import Foundation

extension Double {
    func formattedSting() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        
        return numberFormatter.string(from: NSNumber(value: self))!
    }
}
