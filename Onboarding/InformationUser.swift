//
//  InformationUser.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 30.12.2023.
//

import SwiftUI

struct InformationUser: View {
    
    @State private var sectionSex: SexSection = .Male
    @State private var dateOfBirth = Date.now
    
    @State private var dataHeight: Double = 5.8
    @State private var dataWeight: Int = 183
    @ObservedObject var vmUser: UserInfoViewModel
    var body: some View {
        ZStack {
            Color.themeView.background.ignoresSafeArea(.all)
            VStack {
                VStack(spacing: 16) {
                    Text("Personalize FitHub and Health")
                        .font(.system(size: 40,weight: .semibold))
                        .foregroundStyle(Color.themeView.secondaryText)
                        .multilineTextAlignment(.center)
                        .padding(.top,55)
                    
                    Text("This information ensures fitness and Health data are as accurate as possible.These details are not shared with Apple.")
                        .font(.system(size: 16,weight: .regular))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color.themeView.secondaryText)
                }
                
                GroupBox {
                    HStack {
                        Text("Date of Birth")
                        Spacer()
                        DatePicker(selection: $dateOfBirth, displayedComponents: .date) {
                        }
                            .foregroundStyle(Color.theme.Gray)
                    }
                    
                    Divider()
                    HStack {
                        Text("Sex")
                            .foregroundStyle(Color.white)
                        Spacer()
                        Picker(selection:$vmUser.gender ,
                               label:
                                Text(vmUser.gender.count > 1 ? vmUser.gender : "Select a gender")
                            .font(.headline)
                            .foregroundColor(.purple)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                               ,content: {
                            Text("Section")
                            Text("Male").tag("Male")
                            Text("Female").tag("Female")
                        })
                        .pickerStyle(MenuPickerStyle())
                    }
                  
                    Divider()

                    HStack {
                        Text("Height")
                        Spacer()
                        TextField("5’10”", value: $dataHeight, formatter: NumberFormatter())
                            .frame(width: 40)
                            .foregroundStyle(Color.theme.Gray)
                    }
                    Divider()
                    
                    HStack {
                        Text("Weight")
                        Spacer()
                 
                        TextField("183 lb", value: $dataWeight, formatter: NumberFormatter())
                            .frame(width: 40)
                            .foregroundStyle(Color.theme.Gray)
                    }
             
                    
                }.padding(.horizontal,22)
                    .padding(.top,41)
                
                Spacer()
            }
          
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    InformationUser(vmUser: UserInfoViewModel())
        .preferredColorScheme(.dark)
}

enum SexSection {
    case Male
    case female
}
