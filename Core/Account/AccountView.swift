//
//  AccountView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 31.12.2023.
//

import SwiftUI

struct AccountView: View {
    
    @ObservedObject var vmUser : UserInfoViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.themeView.background.ignoresSafeArea(.all)
                VStack {
                    VStack(alignment: .leading) {
                        
                        NavigationLink {
                            InfoUserImageNameView(vmUser: vmUser, onboardingState: .constant(0))
                        } label: {
                            HStack(alignment: .center,spacing: 10) {
                                ZStack {
                                    if let image = vmUser.imageProfiles {
                                        Image(uiImage: image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 60,height: 60)
                                            .background(Color.theme.Gray03)
                                            .clipShape(Circle())
                                    } else if vmUser.imageProfiles == nil {
                                        Image("")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 60,height: 60)
                                            .background(Color.theme.Gray03)
                                            .clipShape(Circle())
                                    }
                                }
                                
                                Text(vmUser.currentUserName)
                                    .font(.system(size: 18,weight: .regular))
                                    .foregroundStyle(Color.white)
                                Spacer()
                                Image(systemName: "chevron.right")
                            }.padding(.all,10)
                                .background(Color.theme.Gray06)
                                .clipShape(.rect(cornerRadius: 10))
                        }
                       
                    }.padding(.all)
                    
                    List {
                        NavigationLink {
                            InformationUser(vmUser: vmUser)
                        } label: {
                            Text("Health Details")
                        }
                        NavigationLink {
                            GoalUserView(vmUser: vmUser)
                        } label: {
                            Text("Change Goal Daly")
                        }
                        NavigationLink {
                            
                        } label: {
                            Text("Units of Measure")
                        }
                       
                      
                    }
                }
            }
            .navigationTitle("Account")
         
            .onAppear {
                vmUser.loadImage(forKey: "imagePrilesKeySaved")
            }
        }
    }
}


struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(vmUser: UserInfoViewModel())
            .preferredColorScheme(.dark)
    }
}

