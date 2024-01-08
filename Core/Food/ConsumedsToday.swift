//
//  ConsumedsToday.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 08.01.2024.
//

import SwiftUI

struct ConsumedsToday: View {
    var progress  = 0.5
    var body: some View {
        HStack(alignment: .top,spacing: 10) {
            ZStack {
                Circle()
                    .stroke(lineWidth: 3)
                    .frame(width: 50,height: 50)
                    .foregroundStyle(Color.theme.Gray02)
                
                Circle()
                    .trim(from:0, to: CGFloat(self.progress))
                    .stroke(lineWidth: 3)
                    .frame(width: 50,height: 50)
                    .foregroundStyle(Color.red)
         
            }.rotationEffect (Angle(degrees: -90))
            
            VStack(alignment: .leading,spacing: 10) {
                Text("calores")
                    .font(.system(size: 14,weight: .light))
                    .font(.system(size: 10,weight: .light))
                HStack(alignment: .bottom,spacing: 5) {
                    Text("896")
                        .font(.system(size: 16,weight: .regular))
                        .foregroundStyle(Color.black)
                    Text("KCA")
                        .font(.system(size: 10,weight: .light))
                        .foregroundStyle(Color.gray)
                }
            }
        }.padding(.all)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 1)
                    .foregroundStyle(Color.theme.Gray03.opacity(0.3))
            )
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 20))
        .padding(.horizontal,10)
    }
}

#Preview {
    ZStack {
//        Color.black.ignoresSafeArea(.all)
        ConsumedsToday()
    }
}
