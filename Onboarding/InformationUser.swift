//
//  InformationUser.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 30.12.2023.
//

import SwiftUI

struct InformationUser: View {
    
    @State private var sectionSex: SexSection = .Male
    

    let dateFormatter: DateFormatter = {
           let formatter = DateFormatter()
           formatter.dateStyle = .long
           return formatter
       }()

    @ObservedObject var vmUser: UserInfoViewModel
    @State private var birthDate = Date()
    @State private var age: DateComponents = DateComponents()
        
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
                    
                    VStack {
                        DatePicker("Date of Birth", selection: $birthDate, in: ...Date(), displayedComponents: .date)
                            .onChange(of: birthDate, perform: { value in
                                age = Calendar.current.dateComponents([.year, .month, .day], from: birthDate, to: Date())
                            })
                    }

                    
                    Divider()
                    HStack {
                        Text("Gender")
                        Spacer()
                        Picker(selection:$vmUser.currentUserGender ,
                               label:
                                Text(vmUser.currentUserGender.count > 1 ? vmUser.currentUserGender : "Select a gender")
                            .font(.headline)
                            .foregroundColor(.purple)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                               ,content: {
                            Text("Male").tag("Male")
                            Text("Female").tag("Female")
                        })
                        .pickerStyle(MenuPickerStyle())
                    }
                  
                    Divider()

                    HStack {
                        Text("Height")
                        Spacer()
                        TextField("5’10”", value: vmUser.$currentUserHeight, formatter: NumberFormatter())
                            .frame(width: 40)
                            .foregroundStyle(Color.theme.Gray)
                    }
                    Divider()
                    
                    HStack {
                        Text("Weight")
                        Spacer()
                 
                        TextField("183 lb", value: vmUser.$currentUserWeight, formatter: NumberFormatter())
                            .frame(width: 40)
                            .foregroundStyle(Color.theme.Gray)
                    }
             
                    
                }.padding(.horizontal,22)
                    .padding(.top,41)
                Text("Age-> \(age.year ?? 0)")

                Spacer()
            }
        }
      
    }
}

#Preview {
    InformationUser(vmUser: UserInfoViewModel())
}


