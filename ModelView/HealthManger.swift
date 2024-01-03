//
//  HealthManger.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 03.01.2024.
//

import Foundation
import SwiftUI
import HealthKit

extension Date {
    static var startOfDay: Date {
        Calendar.current.startOfDay(for: Date())
    }
}

class HealthManger: ObservableObject {
    
    let healthStore = HKHealthStore()
    
    @Published var activtys: [String : Activty] = [:]
    
    init() {
        
        let steps = HKQuantityType(.stepCount)
        
        let heathTypes: Set = [steps]
        
        Task {
            do {
                try await healthStore.requestAuthorization(toShare: [], read: heathTypes)
            } catch {
                print("Error feacting Helth data")
            }
        }
    }
    
    func fatechTodaySteps() {
        let steps = HKQuantityType(.stepCount)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate) { _, result, error in
            guard let quanity = result?.sumQuantity(), error == nil else {
                print("error fatching today step data")
                return
            }
            let stepConut = quanity.doubleValue(for: .count())
            let activty = Activty(id: 0, title: "Today steps", subtitle: "Goal 10000", image: "figure.walk", amount: stepConut.formattedSting())
            
            DispatchQueue.main.async {
                self.activtys["todaySetps"] = activty
            }
            
            print(stepConut.formattedSting())
        }
        
        healthStore.execute(query)
    }
    
}

extension Double {
    func formattedSting() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        
        return numberFormatter.string(from: NSNumber(value: self))!
    }
}
