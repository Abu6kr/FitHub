//
//  OnboardingView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 31.12.2023.
//

import SwiftUI

struct OnboardingView: View {
    @State private var image = UIImage()
    @ObservedObject var vmUser = UserInfoViewModel()
    
    @State var onboardingState: Int = 0
    
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
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
                    GoalUserView(vmUser: vmUser)
                        .transition(transition)
                case 3:
                    InfoUserImageNameView(vmUser: vmUser, onboardingState: $onboardingState)
                        .transition(transition)
                case 4:
                    NotificationsStartView()
                        .transition(transition)
                default:
                    NotificationsStartView()
                        .transition(transition)
                }
            }
         
            ZStack {
                switch onboardingState {
                case 0...2:
                    Button {
                        withAnimation(.spring) {
                            onboardingState += 1

                        }
                    } label: {
                        ButtonView(title: "Continue", background: Color.theme.Gray03.opacity(0.3), foregroundStyle: Color.themeView.secondaryText)
                            .padding()
                    }
                case 3:
                    Text("")

                case 4:
                    Button(action: {
                        withAnimation(.spring) {
                            isOnboarding = false
                        }
                    }) {
                        ButtonView(title: "Start", background: Color.theme.Gray03.opacity(0.3), foregroundStyle: Color.themeView.secondaryText)
                            .padding()
                    }
                default:
                    Button(action: {
                        withAnimation(.spring) {
                            isOnboarding = false
                        }
                    }) {
                        ButtonView(title: "Start", background: Color.theme.Gray03.opacity(0.3), foregroundStyle: Color.themeView.secondaryText)
                            .padding()
                    }
                }
            }.frame(maxHeight: .infinity,alignment: .bottom)
          
        }  .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    OnboardingView()
}
