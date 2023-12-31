//
//  GetStartedShereView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 28.12.2023.
//

import SwiftUI

struct GetStartedShereView: View {
    @Binding var getSarte: Bool
    var body: some View {
        ZStack {
            Color.themeView.background.ignoresSafeArea(.all)
            
            VStack {
                
                Image("Logo")
                    .resizable()
                    .frame(width: 160,height: 150)
                
                Text("Share Activity")
                    .font(.system(size: 30,weight: .regular))
                    .padding(.bottom,16)
                
                Text("Invite friends to support, challenge, and cheer each other on. Share workouts, receive progress notifications, and send messages --- right from the fitness app.")
                    .font(.system(size: 16,weight: .semibold))
                    .padding(.horizontal,45)
                
                Spacer()
                VStack {
                    
                    Image(systemName: "person.2.fill")
                        .font(.system(size: 22,weight: .semibold))
                        .foregroundStyle(Color.themeView.Coloraccent)
                        .padding(.bottom,5)
                    
                    Text("Activity data like workout types and titles, active calories or kilojoules, exercise minutes, stand or rill hours, steps, and time zone will be securely shared with the people you choose.")
                        .font(.system(size: 12,weight: .regular))
                        .foregroundStyle(Color.gray)
                        .padding(.horizontal,26)
                    
                    Text("See how your data is managed..")
                        .font(.system(size: 10,weight: .regular))
                        .foregroundStyle(Color.themeView.Coloraccent)
                    Button(action: {
                        self.getSarte.toggle()
                    }) {
                        ButtonView(title: "Get Started", background: Color.theme.Gray06, foregroundStyle: Color.themeView.secondaryText)
                            .padding(.horizontal,27)
                            .padding(.vertical,20)
                    }
                }.padding(.bottom,30)
            }
            .padding(.top,34)
            .foregroundStyle(Color.themeView.secondaryText)
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    GetStartedShereView(getSarte: .constant(false))
}
