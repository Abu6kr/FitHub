//
//  TabViewCaloresDayView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 02.01.2024.
//

import SwiftUI

struct TabViewCaloresDayView: View {
    @ObservedObject var vmUser : UserInfoViewModel
    @State private var dayCapes : Int = 1500
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading,spacing: 20) {
                
                Text("Consumed today")
                    .font(.system(size: 15,weight: .light))
                    .foregroundStyle(Color.themeView.activityValueText)
                
                HStack {
                    Text("\(dayCapes)")
                        .foregroundStyle(Color.themeView.secondaryText)
                    Text("/ \(vmUser.currentUserCaloresDay) Kcal")
                        .foregroundStyle(Color.themeView.activityValueText)
                    
                }.font(.system(size: 22,weight: .light))
                
                ZStack {
                    Rectangle()
                        .frame(height: 5)
                        .clipShape(.rect(cornerRadius: 10))
                        .foregroundStyle(Color.theme.Gray.opacity(0.3))
                    
                    Rectangle()
                        .frame(height: 5)
                        .frame(width: 300)
                        .foregroundStyle(Color(red: 0.702, green: 0.025, blue: 0.673))
                        .clipShape(.rect(cornerRadius: 10))
                        .frame(maxWidth: .infinity,alignment:.leading)
                    
                }
            }.padding(.all)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 2)
                        .foregroundStyle(Color.theme.Gray02.opacity(0.2))
                        .shadow(color: .black.opacity(0.1), radius: 1)
                )
                .background(Color.theme.Gray02)
                .clipShape(.rect(cornerRadius: 20))
                .padding(.horizontal,10)
        }
    }
}

#Preview {
    ZStack {
        Color.white
        TabViewCaloresDayView(vmUser: UserInfoViewModel())
    }
}



struct ActivtyCstmesView: View {
    @State var activty: Activty
    var body: some View {
        VStack(alignment: .leading) {
            
            VStack(alignment: .leading) {
                Text(activty.title)
                    .font(.system(size: 15,weight: .semibold))
                    .foregroundStyle(Color.themeView.secondaryText)
            }
            
            HStack {
              
                Image(systemName: activty.image)
                    .font(.system(size: 18,weight: .regular))
                    .foregroundStyle(Color.green)
                    .padding(.leading,5)
                
                Text(activty.amount)
                    .foregroundStyle(Color.themeView.activityValueText)
                    .font(.system(size: 18,weight: .regular))
            }.frame(maxWidth: .infinity,alignment: .leading)
                .padding(.vertical,8)
            
        }.padding(.all,10)
            .frame(maxWidth: .infinity)
            .padding(.all,5)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 1)
                    .foregroundColor(Color.gray.opacity(0.4))
            )
            .background(Color.white)

            .clipShape(.rect(cornerRadius: 20))
            .padding(.horizontal,10)
    }
}

