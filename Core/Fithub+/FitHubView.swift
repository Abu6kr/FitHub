//
//  FitHubView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 28.12.2023.
//

import SwiftUI

struct FitHubView: View {
    
    @State var showScanner: Bool = false
    @State private var showfullScaner: Bool = false
    @ObservedObject var vmUser = UserInfoViewModel()
    @EnvironmentObject var healthManger :  HealthManger
    
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    LinearGradient(colors: [Color.themeView.background2.opacity(0.6),Color.themeView.background2.opacity(0.6)], startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all)
                    ScrollView {
                        VStack {
                            
                            TabBarNavigtionCutems(vmUser: vmUser)
                            
                            TabView {
                                
                                TabViewCaloresDayView(vmUser: vmUser)
                                
                                HealthDay()
                            
                            }.tabViewStyle(.page(indexDisplayMode: .always))
                                .frame(height: 340)
                        }
                    }
                }
                .overlay { FoodScanner.padding(.bottom,35) }
                .onAppear {
                    vmUser.loadImage(forKey: "imagePrilesKeySaved")

                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        withAnimation(.spring){ showScanner = true }
                    }
                    healthManger.fatechTodaySteps()
                }
            }.navigationTitle("FitHub")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FitHubView()
        .environmentObject(HealthManger())
        .preferredColorScheme(.dark)
}



extension FitHubView {
    
    func HealthDay() -> some View {
        VStack(alignment: .leading) {
            Text("Health Day")
                .font(.system(size: 22,weight: .regular))
                .foregroundStyle(Color.white)
                .padding(.leading)
            ZStack {
                HStack {
                    VStack {
                        LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) {
                            ForEach(healthManger.activtys.sorted(by: {$0.value.id < $1.value.id}), id: \.key) { item in
                                ActivtyCstmesView(activty: item.value)
                            }
                        }
                    }
                    Spacer()
                }
            }.padding(.vertical)
                .frame(maxWidth: .infinity)
                .frame(height: 230)
                .background(Color.theme.Gray07)
                .clipShape(.rect(cornerRadius: 12))
                .padding(.horizontal,10)
        }
    }
    
    
    func createRings() -> some View {
        HStack {
            VStack {
                Text("Proteins")
                    .font(.system(size: 18,weight: .regular))
                ZStack {
                    RingView(
                        percentage: 0.9,
                        backgroundColor: Color.theme.moveRingBackground,
                        startColor: Color.theme.moveRingStartColor,
                        endColor: Color.theme.moveRingEndColor,
                        thickness: 10
                    )
                    Text("1400")
                        .font(.system(size: 16,weight: .regular))
                }
                .frame(width: 100, height: 100)
                .aspectRatio(contentMode: .fit)
            }
            Spacer()
            VStack {
                Text("Carb")
                    .font(.system(size: 18,weight: .regular))
                ZStack {
                    RingView(
                        percentage: 0.3,
                        backgroundColor: Color.theme.exerciseRingBackground,
                        startColor: Color.theme.exerciseRingStartColor,
                        endColor: Color.theme.exerciseRingEndColor,
                        thickness: 10
                    )
                    Text("200")
                        .font(.system(size: 16,weight: .regular))
                    
                }
                .frame(width: 100, height: 100)
                .aspectRatio(contentMode: .fit)
            }
            Spacer()
            VStack {
                Text("Fats")
                    .font(.system(size: 18,weight: .regular))
                ZStack {
                    RingView(
                        percentage: 0.5,
                        backgroundColor: Color.theme.standRingBackground,
                        startColor: Color.theme.standRingStartColor,
                        endColor: Color.theme.standRingEndColor,
                        thickness: 10
                    )
                    Text("40")
                        .font(.system(size: 16,weight: .regular))
                }
                .frame(width: 100, height: 100)
                .aspectRatio(contentMode: .fit)
            }
        }
        .padding(.all)
        .frame(maxWidth: .infinity)
        .background(BlurView(style: .dark))
        
    }
    
    func createFooter() -> some View {
        VStack(alignment: .leading, spacing: 0) {

            Divider()
                .background(Color.gray)
                .frame(height: 2)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 15, trailing: 0))
            Text("Flights Climbed")
                .font(Font.system(size: 18, weight: .regular, design: .default))
                .kerning(0.05)
                .foregroundColor(Color.white)
            Text("4")
                .font(Font.system(size: 28, weight: .semibold, design: .rounded))
                .kerning(0.25)
                .foregroundColor(Color.themeView.activityValueText)
                .padding([.top], -3)
            }
            .padding([.leading], 15)
    }
    
    private var FoodScanner: some View {
        Button(action: {self.showfullScaner.toggle()}) {
            ZStack {
                Image(systemName: "camera")
                    .padding(8)
                    .background(Color.gray)
                    .clipShape(.circle)
                
                Image("scanerCode")
                    .foregroundStyle(Color.themeView.secondaryText)
                
            }.frame(maxHeight: .infinity,alignment:.bottom)
            .offset(y: showScanner ? 0 : 300)
            .opacity(showScanner ? 1 : 0)
            .padding(.all)
        }
        .fullScreenCover(isPresented: $showfullScaner){ FoodScannerView() }
    }
}










//                            createRings()
//                                .padding(.vertical)

//                            createFooter()

//                            VStack {
//                                LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) {
//                                    ForEach(healthManger.activtys.sorted(by: {$0.value.id < $1.value.id}), id: \.key) { item in
//                                        ActivtyCstmesView(activty: item.value)
//                                    }
//                                }
//                            }
