//
//  TabBarSummary.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 04.01.2024.
//

import SwiftUI

struct TabBarSummary: View {
    @State private var SectionSummartTab: tabSummary = .medttaion
    var body: some View {
        ZStack {
            ScrollView(.horizontal,showsIndicators: false) {
                HStack {
                    ForEach(modetabSummary){ item in
                        Button(action: {
                            SectionSummartTab = item.tab
                        }, label: {
                            HStack {
                                Image(systemName: item.image)
                                    .foregroundStyle(Color.white)
                                Text(item.tilte)
                                    .font(.system(size: 12,weight: .regular))
                                    .foregroundStyle(Color.white)
                                
                            }.padding(.all)
                            .frame(height: 43)
                            .background(Color.theme.Gray02)
                            .clipShape(.rect(cornerRadius: 4))
                        })
                    }
                }.padding(.leading)
            }
       
        }
    }
}

#Preview {
    ZStack {
        Color.black
        TabBarSummary()
    }
}

struct ModetabSummary: Identifiable {
    let id = UUID().uuidString
    let tilte: String
    let image: String
    var tab: tabSummary
    init(tilte: String, image: String, tab: tabSummary) {
        self.tilte = tilte
        self.image = image
        self.tab = tab
    }
}

let modetabSummary: [ModetabSummary] = [
    ModetabSummary(tilte: "MEDITATION", image: "house", tab: .medttaion),
    ModetabSummary(tilte: "KICKBOXING", image: "house", tab: .htit),
    ModetabSummary(tilte: "READING", image: "house", tab: .reding),
]


enum tabSummary {
    case medttaion
    case htit
    case reding
}
