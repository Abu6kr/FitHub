//
//  FitHubApp.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 28.12.2023.
//

import SwiftUI

@main
struct FitHubApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
                .preferredColorScheme(.dark)
            } else {
                TabBarViewCustems()
                    .preferredColorScheme(.dark)
            }
     
        }
    }
}
