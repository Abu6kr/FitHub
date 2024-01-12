//
//  FitHubApp.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 28.12.2023.
//

import SwiftUI

@main
struct FitHubApp: App {
    @StateObject var healthManger = HealthManger()
    @StateObject var vmUser = UserInfoViewModel()
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
                .preferredColorScheme(.light)
                
            } else {
                TabBarViewCustems()
                    .environmentObject(vmUser)
                    .environmentObject(healthManger)
                    .preferredColorScheme(.light)
            }
     
        }
    }
}
