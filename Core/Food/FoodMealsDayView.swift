//
//  FoodMealsDayView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 06.01.2024.
//

import SwiftUI

struct FoodMealsDayView: View {
    var dataDaye = ["one","to"]
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
           
                ForEach(dataDaye,id: \.self){ items in
                    FoodMealsDay()
                }
            }
        }
    }
}

#Preview {
    ZStack {
        FoodMealsDayView()
         
    }
}
