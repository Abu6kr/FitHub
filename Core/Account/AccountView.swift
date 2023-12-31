//
//  AccountView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 31.12.2023.
//

import SwiftUI

struct AccountView: View {
    
    @ObservedObject var vmUser = UserInfoViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.themeView.background.ignoresSafeArea(.all)
                ScrollView {
                    VStack(alignment: .leading) {
                        
                        NavigationLink {
                            
                        } label: {
                            HStack(alignment: .center,spacing: 10) {
                                ZStack {
                                    if let image = vmUser.imageProfiles {
                                        Image(uiImage: image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 80,height: 80)
                                            .background(Color.theme.Gray03)
                                            .clipShape(Circle())
                                    } else if vmUser.imageProfiles == nil {
                                        Image("")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 80,height: 80)
                                            .background(Color.theme.Gray03)
                                            .clipShape(Circle())
                                    }
                                }
                                
                                Text(vmUser.UserName)
                                    .font(.system(size: 18,weight: .regular))
                                    .foregroundStyle(Color.themeView.secondaryText)
                                Spacer()
                                Image(systemName: "chevron.right")
                            }.padding(.all)
                                .background(Color.theme.Gray06)
                                .clipShape(.rect(cornerRadius: 10))
                        }

                 
                   
                       
                    }.padding(.all)
                }
            }
            .navigationTitle("Account")
            
        }
    }
}


struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            .preferredColorScheme(.dark)
    }
}
