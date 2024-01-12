//
//  AccountView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 31.12.2023.
//

import SwiftUI

struct AccountView: View {
    
    @EnvironmentObject var vmUser : UserInfoViewModel
    @State var image = UIImage()
    
    @State private var showSheet = false
    
    @State private var isAccountEditing = false
    @Namespace private var AccountImage
    @Namespace private var AccountName
    @Namespace private var AccountDissmias
    @Namespace private var ButtoneSave
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.themeView.background.ignoresSafeArea(.all)
                ScrollView {
                    VStack(alignment: .leading) {

                        if isAccountEditing { SecationEditAccount } else { SecationAccount }
                        
                    }.padding(.all)
                    
                    SectionListInfAccount
                }
            }
            .navigationTitle("Account")
            .onAppear { vmUser.loadImage(forKey: "imagePrilesKeySaved") }
        }
    }
}


struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            .environmentObject(UserInfoViewModel())
           
    }
}



extension AccountView {
    
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
            .matchedGeometryEffect(id: "imageProfes", in: AccountImage)
            
            Text(vmUser.currentUserName)
                .font(.system(size: 18,weight: .regular))
                .foregroundStyle(Color.themeView.secondaryText)
                .matchedGeometryEffect(id: "UserName", in: AccountName)
            Spacer()
            Button {
                withAnimation(.spring) {
                    isAccountEditing.toggle()
                }
            } label: {
                Image(systemName: "pencil.line")
                    .font(.system(size: 22, weight: .regular))
                    .foregroundStyle(Color.themeView.secondaryText)
                    .padding(.trailing)
            }
            .matchedGeometryEffect(id: "AccountDissmias", in: AccountDissmias)
            
        }.padding(.all,10)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 1)
                    .foregroundStyle(Color.gray)
            )
            .background(Color.theme.Gray02)
            .clipShape(.rect(cornerRadius: 10))

    }
    
    private var SecationEditAccount: some View {
        VStack {
            Button {
                withAnimation(.spring) {
                    isAccountEditing.toggle()
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.system(size: 22, weight: .regular))
                    .foregroundStyle(Color.themeView.activityValueText)
                    .padding(.trailing)
            }
            .matchedGeometryEffect(id: "AccountDissmias", in: AccountDissmias)
            .frame(maxWidth: .infinity,alignment: .trailing)
            
            ZStack {
                Image(uiImage: image)
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
                }
            }
            .matchedGeometryEffect(id: "imageProfes", in: AccountImage)
            
            Button(action: {showSheet.toggle()}){
                if vmUser.imageProfiles == nil { Text("Section Image") } else { Text("Change photo")}
            }.padding(.top,10)
                .font(.system(size: 16,weight: .regular))
                .sheet(isPresented: $showSheet) {
                    ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Edit Name")
                    .font(.system(size: 16,weight: .regular))
                    .padding(.all,5)
                TextField("AboBakr", text: $vmUser.currentUserName)
                    .frame(height: 50)
                    .padding(.leading)
                    .background(Color.theme.Gray02)
                    .foregroundStyle(Color.themeView.secondaryText)
                    .clipShape(.rect(cornerRadius: 10))
            }.matchedGeometryEffect(id: "UserName", in: AccountName)

            Button(action: {
                vmUser.saveImage(imageName: "imagePrilesKeySaved", image: image, key: "imagePrilesKeySaved")
            }){
                ButtonView(title: "Save Image", background: Color.theme.Gray02, foregroundStyle: Color.themeView.secondaryText)
                    .matchedGeometryEffect(id: "AccountName", in: AccountName)
            }

        }
    }
    
    private var SectionListInfAccount: some View {
        VStack(alignment: .leading, spacing: 15) {
            NavigationLink {
                InformationUser(vmUser: vmUser)
            } label: {
                HStack {
                    Text("Health Details")
                        .foregroundStyle(Color.themeView.secondaryText)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(Color.themeView.secondaryText)

                }
            }
            Divider()
            NavigationLink {
                GoalUserView(vmUser: vmUser)
            } label: {
                HStack {
                    Text("Change Goal Daly")
                        .foregroundStyle(Color.themeView.secondaryText)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(Color.themeView.secondaryText)

                }
            }
            Divider()
            NavigationLink {
                
            } label: {
                HStack {
                    Text("Units of Measure")
                        .foregroundStyle(Color.themeView.secondaryText)

                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(Color.themeView.secondaryText)

                }
            }
           
          
        }.padding(.all)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 1)
                .foregroundStyle(Color.themeView.secondaryText.opacity(0.3))
        )
        .background(Color.theme.Gray02)
        .clipShape(.rect(cornerRadius: 10))
        .padding(.horizontal)

    }
    
}
