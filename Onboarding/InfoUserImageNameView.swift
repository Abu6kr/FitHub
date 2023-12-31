//
//  InfoUserImageNameView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 31.12.2023.
//

import SwiftUI

struct InfoUserImageNameView: View {
    @State private var image = UIImage()
    @State private var showSheet = false
    
    @ObservedObject var vmUser: UserInfoViewModel
    
    var body: some View {
        ZStack {
            Color.themeView.background.ignoresSafeArea(.all)
            VStack {
                Text("Account")
                    .font(.system(size: 40,weight: .semibold))
                    .foregroundStyle(Color.themeView.secondaryText)
                    .padding(.top,55)
                    .frame(maxWidth: .infinity,alignment:.leading)
                    .padding(.leading)
                ZStack {
                    if let image = vmUser.imageProfiles {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .background(Color.theme.Gray02)
                            .clipShape(Circle())
                            .padding(1)
                            .background(
                                RoundedRectangle(cornerRadius: .infinity)
                                    .stroke(lineWidth: 1.0)
                                    .shadow(color: .white, radius: 10)
                                    .foregroundStyle(Color.themeView.secondaryText)
                            )
                            .clipShape(Circle())
                    } else {
                        Image("")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .background(Color.theme.Gray03)
                            .clipShape(Circle())
                            .padding(1)
                            .background(
                                RoundedRectangle(cornerRadius: .infinity)
                                    .stroke(lineWidth: 1.0)
                                    .shadow(color: .white, radius: 10)
                                    .foregroundStyle(Color.themeView.secondaryText)
                            )
                            .clipShape(Circle())
                    }
                }
                
                Button(action: {showSheet.toggle()}){
                    if vmUser.imageProfiles == nil { Text("Section Image") } else { Text("Change photo")}
                }.padding(.top,10)
                    .font(.system(size: 16,weight: .regular))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Name")
                        .font(.system(size: 16,weight: .regular))
                        .padding(.all,5)
                    TextField("AboBakr", text: $vmUser.UserName)
                        .frame(height: 50)
                        .padding(.leading)
                        .background(Color.theme.Gray04)
                        .foregroundStyle(Color.themeView.secondaryText)
                        .clipShape(.rect(cornerRadius: 10))
                }.padding()
                
                Spacer()
            }.foregroundStyle(Color.themeView.secondaryText)
            .sheet(isPresented: $showSheet) {
                ImagePicker(sourceType: .photoLibrary, selectedImage: $vmUser.imageProfiles)
            }
            
            
         
        }
    }
}

#Preview {
    InfoUserImageNameView(vmUser: UserInfoViewModel())
        .preferredColorScheme(.dark)
}
