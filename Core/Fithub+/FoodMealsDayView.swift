//
//  FoodMealsDayView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 06.01.2024.
//

import SwiftUI

struct FoodMealsDayView: View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Meals")
                        .font(.system(size: 20,weight: .regular))
                        .foregroundStyle(Color.themeView.secondaryText)
                    Spacer()
                    Text("Show All")
                        .font(.system(size: 14,weight: .regular))
                        .foregroundStyle(Color.gray)
                    
                }.padding(.all)
                
                HStack {
                    Text("Add Your Meals")
                        .font(.system(size: 15,weight: .regular))
                        .foregroundStyle(Color.themeView.secondaryText)
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "plus")
                            .foregroundStyle(Color.themeView.secondaryText)
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
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea(.all)
        FoodMealsDayView()
    }
}
