//
//  CommunityView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 08.01.2024.
//

import SwiftUI

struct CommunityView: View {
    @ObservedObject var vmUser = UserInfoViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    VStack {
                        NavigationTobBarView(vmUser: vmUser,nameView: "Community", SectionIcone: .Community, ShoeImage: false)
                        
                        //MARK: User Info
                        SecationAccount
                        
                        //MARK: Feed Info
                        VStack(alignment: .leading,spacing: 10) {
                            Text("Feed")
                                .padding(.leading)
                            ForEach(0 ..< 5) { item in
                                VStack(alignment: .leading) {
                                    HStack {
                                        Image("")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 50)
                                            .background(Color.red)
                                            .clipShape(.circle)
                                        VStack(alignment: .leading,spacing: 5) {
                                            Text(vmUser.currentUserName)
                                                .font(.system(size: 18,weight: .regular))
                                                .foregroundStyle(Color.themeView.secondaryText)
                                            Text("@" + vmUser.currentUserName)
                                                .font(.system(size: 15,weight: .regular))
                                                .foregroundStyle(Color.theme.Gray03.opacity(0.3))
                                        }
                                        Spacer()
                                    }
                                    VStack(alignment: .leading,spacing: 10) {
                                        Image("")
                                            .resizable()
                                            .scaledToFill()
                                            .background(Color.red)
                                            .clipShape(.rect(cornerRadius: 10))
                                        Text("textHere")
                                    }
                                    
                                }.padding(.all)
                                .background(Color.gray.opacity(0.3))
                                .clipShape(.rect(cornerRadius: 10))
                            .padding()
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CommunityView()
}

extension CommunityView {
    
    private var SecationAccount: some View {
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
            VStack(alignment: .leading,spacing: 5) {
                Text(vmUser.currentUserName)
                    .font(.system(size: 18,weight: .regular))
                    .foregroundStyle(Color.themeView.secondaryText)
                Text("@" + vmUser.currentUserName)
                    .font(.system(size: 15,weight: .regular))
                    .foregroundStyle(Color.theme.Gray03.opacity(0.3))
            }
            Spacer()
            Button {
 
            } label: {
                Image(systemName: "pencil.line")
                    .font(.system(size: 22, weight: .regular))
                    .foregroundStyle(Color.themeView.secondaryText)
                    .padding(.trailing)
            }
            
        }.padding(.all,10)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 1)
                    .foregroundStyle(Color.gray)
            )
            .background(Color.theme.Gray02)
            .clipShape(.rect(cornerRadius: 10))
            .padding(.all)

    }
    
}
