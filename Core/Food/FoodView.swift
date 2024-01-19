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
    @State private var ShowAddFodd: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    VStack {
                        NavigationTobBarView(nameView: "Food", SectionIcone: .Food, ShoeImage: true)
                        PicerDateCloner
                        NavigationLink {InfocarbohydrateDayView()} label: { TabViewCaloresDayView(vmUser: vmUser)}
                        
                        LazyVGrid(columns: columns,alignment: .center){
                          
                            ConsumedsToday(title: "Calories", dataColores: 960, background: Color.red)
                            ConsumedsToday(title: "Protein", dataColores: 973, background: Color.green)
                        }
                        Button(action: {ShowAddFodd.toggle()}, label: {
                            FoodMealsDayView()
                        })
                     
                            .fullScreenCover(isPresented: $ShowAddFodd){
                                SeactionMealsView()
                            }
                    }
                }
            }
        }
        .onAppear {
            vmUser.loadImage(forKey: "imagePrilesKeySaved")
            healthManger.fatechTodaySteps()
            healthManger.fatechTodayCalores()
            vmUser.exteactCuetData()
        }
        
    }
}

#Preview {
    FoodView()
        .environmentObject(HealthManger())
}


extension FoodView {
    private var PicerDateCloner: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(spacing: 5) {
            
                ForEach(vmUser.cruuentWeek,id: \.self) { data in
                    VStack {
                        Text(vmUser.extracDate(date: data).prefix(1))
                            .font(.system(size: 14,weight:.regular))
                            .foregroundStyle(vmUser.isSameDay(date1:vmUser.cruuentDay , date2: data) ? Color.white :  Color.gray)
                        Text(vmUser.getDateFormat(date: data))
                            .font(.system(size: 18,weight: .regular))
                    }
                        .foregroundStyle(vmUser.isSameDay(date1:vmUser.cruuentDay , date2: data) ? Color.white :  Color.black)
                        .multilineTextAlignment(.center)
                        .padding(.all,10)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 1)
                                .foregroundStyle(Color.theme.Gray03.opacity(0.4))
                        )
                        .background(vmUser.isSameDay(date1:vmUser.cruuentDay , date2: data) ? Color.black :  Color.white)
                        .clipShape(.rect(cornerRadius: 20))
                        .frame(width: 50,height: 90)
                        .onTapGesture {
                            withAnimation {
                                vmUser.cruuentDay = data
                            }
                        }

                }
            }.padding(.horizontal,10)
        }    }
}
