//
//  TabBarNavigtionCutems.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 01.01.2024.
//

import SwiftUI

struct TabBarNavigtionCutems: View {
    @ObservedObject var vmUser : UserInfoViewModel
    var body: some View {
        HStack {

            NavigationLink {
                AccountView(vmUser: vmUser)
            } label: {
                if let image = vmUser.imageProfiles {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .background(Color.red)
                        .clipShape(Circle())
                        .padding(.horizontal)
                } else if vmUser.imageProfiles == nil {
                    Image("")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .background(Color.theme.Gray02)
                        .clipShape(Circle())
                        .padding(.horizontal)
                }
            }
            Spacer()
            Text(Date.now, format: .dateTime.day().month().year())
                .foregroundStyle(Color.gray)
            
            Image(systemName: "bell")
                .font(.system(size: 15,weight: .regular))
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: .infinity)
                        .stroke(lineWidth: 1.0)
                )
                .padding(.horizontal)

                
        }.padding(.vertical)

        .onAppear {
            vmUser.loadImage(forKey: "imagePrilesKeySaved")
        }
    }
}



struct TabBarNavigtionCutems_Previews: PreviewProvider {
    static var previews: some View {
        TabBarNavigtionCutems(vmUser: UserInfoViewModel())
            .padding(.all)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}

