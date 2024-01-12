//
//  FoodMealsDay.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 12.01.2024.
//

import SwiftUI

struct FoodMealsDay: View {
    @State private var showDitels: Bool = false

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "takeoutbag.and.cup.and.straw")
                Text("Meals One")
                    .font(.system(size: 15,weight: .regular))
                    .foregroundStyle(Color.themeView.secondaryText)
                Spacer()
                Button(action: {
                    withAnimation(.easeInOut){
                        showDitels.toggle()
                    }
                }) {
                    Image(systemName: "plus")
                        .foregroundStyle(Color.themeView.secondaryText)
                }
                
            }.padding(.init(top: 16, leading: 16, bottom: showDitels ? 0 : 16, trailing: 16))
            if showDitels {
                ZStack(alignment: .top){
                    Rectangle()
                        .frame(height: 3)
                        .foregroundStyle(Color.theme.Gray03.opacity(0.1))
                    HStack(spacing: 30) {
                        Text("80,0")
                        Text("80,0")
                        Text("80,0")
                        Text("8%")
                        Spacer()
                        Button {
                            withAnimation(.easeInOut){
                                showDitels.toggle()
                            }
                        } label: {
                            Image(systemName: "chevron.down")
                        }

                    }.padding(.all)
                        .background(Color.theme.Gray03.opacity(0.1))
                }
            }
        }.frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 2)
                    .foregroundStyle(Color.theme.Gray02.opacity(0.2))
                    .shadow(color: .black.opacity(0.1), radius: 1)
            )
            .background(Color(red: 0.957, green: 0.957, blue: 0.957))
            .clipShape(.rect(cornerRadius: 20))
            .padding(.horizontal,10)

    }
}

#Preview {
    FoodMealsDay()
}


