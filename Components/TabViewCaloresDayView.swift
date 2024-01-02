//
//  TabViewCaloresDayView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 02.01.2024.
//

import SwiftUI

struct TabViewCaloresDayView: View {
    @ObservedObject var vmUser : UserInfoViewModel
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading,spacing: 20) {
                    Text("Calores")
                        .font(.system(size: 18,weight: .bold))
                        .foregroundStyle(Color.white)
                    
                    ZStack {
                        Text("\(vmUser.currentUserCaloresDay)")
                            .font(.system(size: 22,weight: .bold))
                            .foregroundStyle(Color.white)
                        RoundedRectangle(cornerRadius: .infinity)
                            .stroke(lineWidth: 8)
                            .frame(width: 141,height: 141)
                            .foregroundStyle(Color.theme.ColorPinerDark)
                    }
                }.padding(.all)
                Spacer()
            }
        }.padding(.vertical)
        .frame(maxWidth: .infinity)
        .background(Color.theme.Gray07)
        .clipShape(.rect(cornerRadius: 12))
        .padding(.horizontal,10)
        
        
    }
}

#Preview {
    TabViewCaloresDayView(vmUser: UserInfoViewModel())
}
