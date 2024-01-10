//
//  DailyTaskView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 10.01.2024.
//

import SwiftUI

struct DailyTaskView: View {
    var body: some View {
        VStack(spacing: 10) {
            ForEach(0 ..< 5) { item in
                HStack {
                    Image("VidewOnew")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80)
                 
                        
                        Spacer()
                        VStack(alignment: .leading,spacing: 5) {
                            Text("Shoulder Blacster")
                                .font(.system(size: 16,weight: .regular))
                                .foregroundStyle(Color.black)
                            
                            Text("7:30 - 8:15 am")

                            HStack {
                                Text("45 min")
                                Text("120 kcal")
                            }
                            
                        }.padding(.all)
                            .font(.system(size: 15,weight: .light))
                            .foregroundStyle(Color.gray)
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "play.fill")
                            .font(.system(size: 14,weight: .light))
                            .foregroundStyle(Color.black)
                            .padding(.all,10)
                            .background(
                                RoundedRectangle(cornerRadius: .infinity)
                                    .stroke(lineWidth: 2)
                                    .foregroundStyle(Color.black)
                            )
                    }.padding(.trailing)
                }.frame(height: 100)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 2)
                            .foregroundStyle(Color.theme.Gray03.opacity(0.2))
                    )
                    .background(Color.white)
                    .clipShape(.rect(cornerRadius: 20))
            }
        }.padding(.horizontal, 10)
        
    }
}

#Preview {
    DailyTaskView()
}
