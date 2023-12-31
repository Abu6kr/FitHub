//
//  OnboardingView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 31.12.2023.
//

import SwiftUI

struct OnboardingView: View {
    
    @ObservedObject var vmUser = UserInfoViewModel()
    
    @State var onboardingState: Int = 0
    
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    
    var body: some View {
        ZStack {
            
            ZStack {
                switch onboardingState {
                case 0:
                    WelcomeView()
                        .transition(transition)
                case 1:
                    InformationUser(vmUser: vmUser)
                        .transition(transition)
                case 2:
                    GoalUserView()
                        .transition(transition)
                case 3:
                    InfoUserImageNameView(vmUser: vmUser)
                        .transition(transition)
                default:
                    ZStack {
                        Color.themeView.background.ignoresSafeArea(.all)
                        VStack {
                            Text(vmUser.UserName)
                                .foregroundStyle(Color.white)
                            Text(vmUser.gender)
                                .foregroundStyle(Color.white)
                        }
                    }
                        
                }
            }
         
            ZStack {
                if onboardingState == 2 {
                    Button(action: {
                        withAnimation(.spring) {
                            onboardingState += 1
                        }
                    }) {
                        ButtonView(title: "Set Move Goal", background: Color.theme.Gray05, foregroundStyle: Color.themeView.secondaryText)
                            .padding()
                    }
                } else {
                    Button {
                        withAnimation(.spring) {
                            onboardingState += 1
                            if onboardingState != 1 {
                                vmUser.saveUsrInfo()
                            }
                        }
                    } label: {
                        ButtonView(title: "Continue", background: Color.theme.Gray05, foregroundStyle: Color.themeView.secondaryText)
                            .padding()
                    }
                }
            }.frame(maxHeight: .infinity,alignment: .bottom)
          
        }
    }
}

#Preview {
    OnboardingView()
        .preferredColorScheme(.dark)
}
