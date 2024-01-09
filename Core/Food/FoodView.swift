//
//  FoodView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 08.01.2024.
//

import SwiftUI

struct FoodView: View {
    @ObservedObject var vmUser = UserInfoViewModel()
    @EnvironmentObject var healthManger :  HealthManger
    
    let columns = [
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    VStack {
                        NavigationTobBarView(nameView: "Food", SectionIcone: .Food, ShoeImage: true)
                        
                        NavigationLink {
                            InfocarbohydrateDayView()
                        } label: {
                            TabViewCaloresDayView(vmUser: vmUser)
                        }
                        
                        LazyVGrid(columns: columns,alignment: .center){
                            ForEach(0 ..< 4) { item in
                                ConsumedsToday()
                            }
                        }
                        
                        FoodMealsDayView()
                        
                    }
                }
            }
        }
        .onAppear {
//            vmUser.loadImage(forKey: "imagePrilesKeySaved")
            healthManger.fatechTodaySteps()
            healthManger.fatechTodayCalores()
        }
        
    }
}

#Preview {
    FoodView()
        .environmentObject(HealthManger())
}
