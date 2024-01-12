//
//  WelcomeView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 30.12.2023.
//

import SwiftUI

struct WelcomeView: View {
    
    //MARK: FitHub Icone
    @State private var PlayAnmcisens: Bool = false
    @State private var PlayAnmcisens2: Bool = false
    @State private var PlayAnmcisens3: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.themeView.background.ignoresSafeArea()
                VStack {
                    VStack {
                        Text("Welcome to FitHub")
                            .font(.system(size: 40,weight: .semibold))
                            .foregroundStyle(Color.themeView.secondaryText)
                            .padding(.vertical,55)
                        
                        VStack(spacing: 38) {
                            HStack(alignment: .center,spacing: 12) {
                                //MARK: image form TabBar
                                SummaryIcon
                                VStack(alignment: .leading,spacing: 2) {
                                    Text("See Your Activity")
                                        .foregroundStyle(Color.themeView.secondaryText)
                                        .font(.system(size: 16,weight: .regular))
                                    Text("Skeep up with your rings, workouts, awards, and trends.")
                                        .font(.system(size: 16,weight: .regular))
                                        .foregroundStyle(Color.theme.Gray)
                                }
                            }
                            
                            HStack(alignment: .center,spacing: 12) {
                                //MARK: image form TabBar
                                VStack {
                                    FindesShereIcon
                                }.frame(width: 20,height: 50)
                                
                                VStack(alignment: .leading,spacing: 2) {
                                    Text("See Your Activity")
                                        .foregroundStyle(Color.themeView.secondaryText)
                                        .font(.system(size: 16,weight: .regular))
                                    Text("Skeep up with your rings, workouts, awards, and trends.")
                                        .font(.system(size: 16,weight: .regular))
                                        .foregroundStyle(Color.theme.Gray)
                                }
                            }
                            
                            HStack(alignment: .center,spacing: 12) {
                                //MARK: image form TabBar
                                runFitHubIcon
                                VStack(alignment: .leading,spacing: 2) {
                                    Text("See Your Activity")
                                        .foregroundStyle(Color.themeView.secondaryText)
                                        .font(.system(size: 16,weight: .regular))
                                    Text("Skeep up with your rings, workouts, awards, and trends.")
                                        .font(.system(size: 16,weight: .regular))
                                        .foregroundStyle(Color.theme.Gray)
                                }
                            }
                        }
                        
                    }.padding()
                    
                    Spacer()
                       
                }
                .onAppear {
                    PlayAnmcisens = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        withAnimation(.spring){ PlayAnmcisens2 = true }
                    }
                    withAnimation(.easeInOut(duration: 3.5).repeatForever(autoreverses: true)) {
                        PlayAnmcisens2.toggle()
                        PlayAnmcisens3.toggle()
                    }
                    
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
     
}


extension WelcomeView {
    
    private var SummaryIcon: some View {
        VStack {
            
            ZStack {
                if PlayAnmcisens == true {
                    RingView(
                        percentage: 2,
                        backgroundColor: Color.theme.Gray03.opacity(0.2),
                        startColor: Color.theme.Gray03.opacity(0.6),
                        endColor: Color.theme.Gray03,
                        thickness: 2
                    )
                } else {
                    RingView(
                        percentage: 2,
                        backgroundColor: Color.gray,
                        startColor: Color.gray,
                        endColor: Color.gray,
                        thickness: 2
                    )
                }
            }.frame(width: 23, height: 23)
            
        }
    }
    
    private var FindesShereIcon: some View {
        ZStack {
            if PlayAnmcisens2 == true {
                Image(systemName: "person.line.dotted.person.fill")
                    .foregroundStyle(Color.theme.Gray03)
            }
        }
        
    }
    
    private var runFitHubIcon: some View {
        VStack {
            ZStack {
                Image(systemName: "figure.run")
                    .offset(x: PlayAnmcisens3 ? 50 : 0)
                    .foregroundStyle(Color.white)
                Image(systemName: "figure.run")
                    .offset(x: PlayAnmcisens3 ? 0 : -50)
                    .foregroundStyle(Color.white)
            }.font(.system(size: 10))
                .frame(width: 24.5,height: 24.5)
                .background(Color.theme.Gray03)
                .clipShape(Circle())
            
        }
        
    }
}
