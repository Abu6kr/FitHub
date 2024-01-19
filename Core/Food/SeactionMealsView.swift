//
//  SeactionMealsView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 19.01.2024.
//

import SwiftUI

struct SeactionMealsView: View {
    @State var sectionMeals: FoodSeaction = .breakfast
    @State var Protens: Double = 0
    @Environment(\.dismiss) var dismis
    var body: some View {
        ZStack {
            Color.themeView.background.ignoresSafeArea(.all)
            VStack {
                
                HStack {
                    ForEach(moldeFoodSeaction){ meals in
                        Button(action: {
                            withAnimation(.spring) {
                                sectionMeals = meals.Meals
                            }
                        }){
                            Text(meals.nameMeal)
                                .padding(.all)
                                .font(.system(size: 15, weight: sectionMeals == meals.Meals ? .bold : .regular))
                                .background(sectionMeals == meals.Meals ? Color.theme.Gray03.opacity(0.5) : Color.white)
                                .foregroundStyle(sectionMeals == meals.Meals ? Color.white : Color.black)
                                .clipShape(.rect(cornerRadius: 10))
                        }
                  
                    }
                }.padding(.all)
                .frame(maxWidth: .infinity)
                .background(Color.theme.Gray02)
                
                ScrollView {
                    Button {
                        dismis()
                    } label: {
                        Text("dismais")

                    }

                    VStack(alignment: .leading) {
                        
                        Group {
                            switch sectionMeals {
                            case .breakfast:
                                Text("breakfast")
                            case .lunch:
                                Text("lunch")
                            case .tea:
                                Text("tea")
                            case .dinner:
                                Text("dinner")
                            }
                        }
                        
                        HStack {
                            ZStack {
                                Circle()
                                    .stroke(lineWidth: 3)
                                    .frame(width: 50,height: 50)
                                    .foregroundStyle(Color.theme.Gray02)
                                
                                Circle()
                                    .trim(from:0, to: CGFloat(Protens))
                                    .stroke(lineWidth: 3)
                                    .frame(width: 50,height: 50)
                                    .foregroundStyle(Color.red)
                                
                            }.rotationEffect(Angle(degrees: -90))
                                Text("Protens")
                          Spacer()
                            TextField("90g", value: $Protens, format: .number)
                                .frame(width: 90)
                            
                        }
                        HStack {
                            ZStack {
                                Circle()
                                    .stroke(lineWidth: 3)
                                    .frame(width: 50,height: 50)
                                    .foregroundStyle(Color.theme.Gray02)
                                
                                Circle()
                                    .trim(from:0, to: CGFloat(Protens))
                                    .stroke(lineWidth: 3)
                                    .frame(width: 50,height: 50)
                                    .foregroundStyle(Color.orange)
                                
                            }.rotationEffect(Angle(degrees: -90))
                                Text("Carpes")
                          Spacer()
                            TextField("90g", value: $Protens, format: .number)
                                .frame(width: 90)
                            
                        }
                        
                        
                        Text("")
                        
                        
                    }.padding(.all)
                }
                
            }
        }
    }
}

#Preview {
    SeactionMealsView()
}





struct MoldeFoodSeaction: Identifiable {
    var id = UUID().uuidString
    let nameMeal: String
    let Meals: FoodSeaction
    init(id: String = UUID().uuidString, nameMeal: String, Meals: FoodSeaction) {
        self.id = id
        self.nameMeal = nameMeal
        self.Meals = Meals
    }
}

let moldeFoodSeaction: [MoldeFoodSeaction] = [
    MoldeFoodSeaction(nameMeal: "breakfast", Meals: .breakfast),
    MoldeFoodSeaction(nameMeal: "lunch", Meals: .lunch),
    MoldeFoodSeaction(nameMeal: "tea", Meals: .tea),
    MoldeFoodSeaction(nameMeal: "dinner", Meals: .dinner),
    
]

enum FoodSeaction {
    case breakfast
    case lunch
    case tea
    case dinner
}
