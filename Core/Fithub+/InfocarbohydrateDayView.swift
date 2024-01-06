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
            Color.themeView.background.ignoresSafeArea(.all)
            VStack {
                Text("\(vmUser.currentUserCaloresDay)")
                    .font(.system(size: 22,weight: .bold))
                    .padding(.all)
                HStack(alignment: .center,spacing: 22) {
                    VStack {
                        Text("50%")
                        Text("proteins")
                    }
                    VStack {
                        Text("40%")
                        Text("fats")
                    }
                    VStack {
                        Text("50%")
                        Text("carbohydrates")
                    }
                }                      
            
            }.foregroundStyle(Color.white)

        }
    }
}

#Preview {
    InfocarbohydrateDayView()
}
