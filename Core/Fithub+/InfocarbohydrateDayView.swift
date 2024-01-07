//
//  InfocarbohydrateDayView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 06.01.2024.
//

import SwiftUI

struct InfocarbohydrateDayView: View {
    @ObservedObject var vmUser = UserInfoViewModel()
    var body: some View {
        ZStack {
            Color.themeView.background2.ignoresSafeArea(.all)
            VStack {
                
                Text("\(vmUser.currentUserCaloresDay)")
                    .frame(width: 200)
                    .font(.system(size: 50,weight: .semibold))
                    .foregroundStyle(Color.themeView.secondaryText)
                    .background(
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(lineWidth: 2)
                    )
                    .background(Color.themeView.background2)
                    .clipShape(.rect(cornerRadius: 22))
                HStack(alignment: .center,spacing: 22) {
                    VStack {
                        Text("50 %")
                        Text("proteins")
                    }.padding(.all)
                    .background(
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(lineWidth: 2)
                    )
                    .background(Color.themeView.background2)
                    .clipShape(.rect(cornerRadius: 22))
                    VStack {
                        Text("40 %")
                        Text("fats")
                    }.padding(.all)
                        .background(
                            RoundedRectangle(cornerRadius: 22)
                                .stroke(lineWidth: 2)
                        )
                        .background(Color.themeView.background2)
                        .clipShape(.rect(cornerRadius: 22))
                    VStack {
                        Text("50 %")
                        Text("carbs")
                    }.padding(.all)
                        .background(
                            RoundedRectangle(cornerRadius: 22)
                                .stroke(lineWidth: 2)
                        )
                        .background(Color.themeView.background2)
                        .clipShape(.rect(cornerRadius: 22))
                }
            
            }.foregroundStyle(Color.white)

        }
    }
}

#Preview {
    InfocarbohydrateDayView()
}
