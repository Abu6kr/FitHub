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
                    .font(.system(size: 15,weight: .regular))
                    .foregroundStyle(Color.themeView.activityValueText)
                
                HStack {
                    Text("\(dayCapes)")
                        .foregroundStyle(Color.themeView.activityValueText)
                    Text("/ \(vmUser.currentUserCaloresDay) Kcal")
                        .foregroundStyle(Color.themeView.activityValueText.opacity(0.5))
                    
                }.font(.system(size: 22,weight: .semibold))
                
                ZStack {
                    Rectangle()
                        .frame(height: 5)
                        .clipShape(.rect(cornerRadius: 10))
                        .foregroundStyle(Color.theme.Red.opacity(0.5))
                    
                    Rectangle()
                        .frame(height: 5)
                        .frame(width: 100)
                        .foregroundStyle(Color.theme.Red)
                        .clipShape(.rect(cornerRadius: 10))
                        .frame(maxWidth: .infinity,alignment:.leading)
                    
                }
            }.padding(.all)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(lineWidth: 2)
                        .foregroundStyle(Color.theme.Gray02.opacity(0.2))
                        .shadow(color: .black.opacity(0.1), radius: 1)
                )
                .background(Color.theme.Gray07)
                .clipShape(.rect(cornerRadius: 15))
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
                    .foregroundStyle(Color.white)
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
            .background(Color.theme.Gray07)
            .clipShape(.rect(cornerRadius: 12))
            .padding(.horizontal,10)
    }
}

