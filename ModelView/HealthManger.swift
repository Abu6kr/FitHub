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
        let caloreis = HKQuantityType(.activeEnergyBurned)
        let heathTypes: Set = [steps,caloreis]
        
        Task {
            do {
                try await healthStore.requestAuthorization(toShare: [], read: heathTypes)
                fatechTodaySteps()
                fatechTodayCalores()
            } catch {
                print("Error feacting Helth data")
            }
        }
    }
    
    func fatechTodaySteps() {
        let steps = HKQuantityType(.stepCount)
        let caloreis = HKQuantityType(.activeEnergyBurned)
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
            
//            print(stepConut.formattedSting())
        }
        healthStore.execute(query)
    }
    
    
    func fatechTodayCalores() {
        let calores = HKQuantityType(.activeEnergyBurned)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: calores, quantitySamplePredicate: predicate) { _, result, error in
            guard let quanity = result?.sumQuantity(), error == nil else {
                print("error fatching today calorie data")
                return
            }
            
            let caloriesBurned = quanity.doubleValue(for: .kilocalorie())
            let activty = Activty(id: 0, title: "Today Calories", subtitle: "Goal 900", image: "flame", amount: caloriesBurned.formattedSting())
            
            DispatchQueue.main.async {
                self.activtys["todayCalories"] = activty
            }
            
//            print(caloriesBurned.formattedSting())
            
        }
        healthStore.execute(query)
    }
    
    
    
    
}

