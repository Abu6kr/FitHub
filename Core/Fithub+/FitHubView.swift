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
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    Color.themeView.background.ignoresSafeArea(.all)
                    ScrollView {
                      
                        VStack {
                            TabBarNavigtionCutems(vmUser: vmUser)
                            
                            createRings()
                                .padding(.vertical)
                          
                            createFooter()
                          
                        }
                    }
                }
                .overlay { FoodScanner.padding(.bottom,35) }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        withAnimation(.spring){ showScanner = true }
                    }
                    vmUser.loadImage(forKey: "imagePrilesKeySaved")
                }
            }
            .navigationTitle("FitHub")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FitHubView()
        .preferredColorScheme(.dark)
}

extension FitHubView {
    
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
            HStack(spacing: 60) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Steps")
                        .font(Font.system(size: 18, weight: .regular, design: .default))
                        .kerning(0.05)
                        .foregroundColor(Color.white)
                    Text("5 588")
                        .font(Font.system(size: 28, weight: .semibold, design: .rounded))
                        .kerning(0.25)
                        .foregroundColor(Color.themeView.activityValueText)
                        .padding([.top], -3)
                }
                VStack(alignment: .leading, spacing: 0) {
                    Text("Distance").font(Font.system(size: 18, weight: .regular, design: .default)).kerning(0.05).foregroundColor(Color.white)
                    (
                        Text("4,5")
                            .font(Font.system(size: 28, weight: .semibold, design: .rounded))
                            .kerning(0.25)
                            .foregroundColor(Color.themeView.activityValueText)
                        + Text("KM")
                            .font(Font.system(size: 24, weight: .semibold, design: .rounded))
                            .kerning(0.3).foregroundColor(Color.themeView.activityValueText)
                    )
                        .padding([.top], -3)
                }
                Spacer()
            }
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
            }.frame(maxHeight: .infinity,alignment:.bottom)
            .offset(y: showScanner ? 0 : 300)
            .opacity(showScanner ? 1 : 0)
            .padding(.all)
        }
        .fullScreenCover(isPresented: $showfullScaner){ FoodScannerView() }
    }
}


