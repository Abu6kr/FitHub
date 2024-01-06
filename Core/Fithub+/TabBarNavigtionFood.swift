//
//  TabBarNavigtionFood.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 06.01.2024.
//

import SwiftUI

struct TabBarNavigtionFood: View {
    
    @Binding var SectionTabFood: TabBarFood
    
    var body: some View {
        ZStack {
            ZStack {
                if SectionTabFood == .food {
                    HStack {
                        Rectangle()
                            .frame(width: 80)
                            .foregroundStyle(Color.themeView.background2)
                            .clipShape(.rect(cornerRadius: 22))
                            .padding(.leading,15)
                        Spacer()
                    }
                } else if SectionTabFood == .water {
                    HStack {
                        Spacer()
                        Rectangle()
                            .frame(width: 80)
                            .foregroundStyle(Color.themeView.background2)
                            .clipShape(.rect(cornerRadius: 22))
                        Spacer()
                       
                    }
                } else if SectionTabFood == .reading {
                    HStack {
                        Spacer()
                        Rectangle()
                            .frame(width: 80)
                            .foregroundStyle(Color.themeView.background2)
                            .clipShape(.rect(cornerRadius: 22))
                            .padding(.trailing,15)
                    }
                }
            }
            HStack {
                ForEach(tabBarFoodCutems){ items in
                    Button(action: {
                        withAnimation(.spring) {
                            SectionTabFood = items.tab
                        }
                    }) {
                        HStack(spacing: 3) {
                            Text(items.Title)
                                .font(.system(size: 14,weight: .regular))
                                .foregroundStyle(SectionTabFood == items.tab ? Color.white: Color.themeView.activityValueText)
                            if SectionTabFood == items.tab {
                                Image(systemName:  items.icone)
                                    .font(.system(size: 10, weight: .regular))
                                
                            }
                        }
                    }
                }.frame(maxWidth: .infinity)
            }
        } .background(Color.theme.Gray07)
            .clipShape(.rect(cornerRadius: 22))
                .background(RoundedRectangle(cornerRadius: 22)
                .stroke(lineWidth: 1)
                .foregroundStyle(Color.theme.Gray02))
                .frame(height: 43)
                .padding(.all)

    }
}

struct TabBarNavigtionFood_Previews: PreviewProvider {
    static var previews: some View {
        TabBarNavigtionFood(SectionTabFood: .constant(.food))
            .padding(.all)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}



struct TabBarFoodCutems: Identifiable {
    var id = UUID().uuidString
    let Title: String
    let icone: String
    let tab : TabBarFood
    init(id: String = UUID().uuidString, Title: String, icone: String, tab: TabBarFood) {
        self.id = id
        self.Title = Title
        self.icone = icone
        self.tab = tab
    }
}
let tabBarFoodCutems: [TabBarFoodCutems] = [
    TabBarFoodCutems(Title: "Food", icone: "takeoutbag.and.cup.and.straw.fill", tab: .food),
    TabBarFoodCutems(Title: "water", icone: "drop.fill", tab: .water),
    TabBarFoodCutems(Title: "Rading", icone: "book.pages", tab: .reading)
]


enum TabBarFood {
    case food
    case water
    case reading
}
