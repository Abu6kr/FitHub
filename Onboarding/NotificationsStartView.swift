//
//  NotificationsStartView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 01.01.2024.
//

import SwiftUI

struct NotificationsStartView: View {
    
    @State private var animationImage: Bool = false
    
    @State private var animationText: Bool = false
    
    var body: some View {
        ZStack {
            Color.themeView.background.ignoresSafeArea(.all)
            ZStack {
                Image("NotificationsImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 295, height: 331)
                    .frame(maxHeight: .infinity,alignment: .top)
                    .offset(y: animationImage ? 30 : 450)
                    .padding(.all)
                
                VStack {
                    Text("Stay Motivated with Fitness Notifications")
                        .font(.system(size: 36,weight: .semibold))
                        .foregroundStyle(Color.white)
                        .opacity(animationText ? 1 : 0)
                        .offset(x: animationText ? 0 : -450)
                        .padding(.top,14)
                        .padding(.horizontal,10)

                    Text("Notifications can help you close your rings, cheer on your friends, and see what’s new with Fitness+.")
                        .font(.system(size: 18,weight: .regular))
                        .multilineTextAlignment(.center)
                        .opacity(animationText ? 1 : 0)
                        .offset(x: animationText ? 0 : 450)
                        .foregroundStyle(Color.theme.Gray02)
                        .padding(.top,11)
                        .padding(.horizontal,10)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 388)
                .background(Color.theme.Gray06)
                .frame(maxHeight: .infinity,alignment:.bottom)

                .onAppear {
                    withAnimation(.easeInOut(duration: 1.0)){
                        animationImage = true
                        animationText = true
                    }
                    withAnimation(.spring){
                        animationText = true
                    }
                }
            }
        }
    }
}

#Preview {
    NotificationsStartView()
}
