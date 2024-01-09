//
//  TabBarViewCustems.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 29.12.2023.
//

import SwiftUI

struct TabBarViewCustems: View {
    @EnvironmentObject var healthManger :  HealthManger
    
    @ObservedObject var vmUser = UserInfoViewModel()

    
    @State private var sectionTabBar: tabBarTab = .Food
    
    @State private var isActiveTab: Bool = false
    
    var body: some View {
        ZStack {
            
            Group {
                switch sectionTabBar {
                    case .HomeFitHub:
                        FitHubView()
                    case .WorkOut:
                        SummaryView()
                    case .Food:
                        FoodView()
                    case .Note:
                        NoteView()
                    case .Community:
                        CommunityView()
                }
            }
            
            VStack {
                HStack(alignment: .center,spacing: 30) {
                    ForEach(moldeTabBar){ items in
                        Button(action: {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                sectionTabBar = items.tab
                            }
                        }){
                            ZStack {
                                Text(items.title)
                                    .font(.system(size: 12,weight: .regular))
                                    .foregroundStyle(sectionTabBar == items.tab ? Color.white : Color.black)
                            }
                        }
                    }
                }
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(Color.theme.Gray03.opacity(0.2))
                            .overlay(
                                HStack {
                                    if sectionTabBar == .Note {Spacer()}
                                    if sectionTabBar == .Note {Spacer()}
                                    
                                    if sectionTabBar == .WorkOut {Spacer()}
                                    
                                    if sectionTabBar == .Food {Spacer()}

                                    
                                    if sectionTabBar == .Community {Spacer()}
                                    
                                    RoundedRectangle(cornerRadius: .infinity)
                                        .foregroundStyle(Color.black)
                                        .frame(width: sectionTabBar == .Community ? 100 : 70, height: 50)
                                    
                                    if sectionTabBar == .HomeFitHub {Spacer()}
                                    
                                    if sectionTabBar == .WorkOut {Spacer()}
                                    if sectionTabBar == .WorkOut {Spacer()}
                                    if sectionTabBar == .WorkOut {Spacer()}
                                    
                                    if sectionTabBar == .Food {Spacer()}
                                    
                                    if sectionTabBar == .Note {Spacer()}

                                    
                                }.padding(.horizontal,5)
                            )
                    )
                    .background(Color.themeView.background)
                    .clipShape(.rect(cornerRadius: 30))
                    .padding(.horizontal,10)
             
            }.frame(maxHeight:.infinity,alignment: .bottom)
        }
        .onAppear {
            vmUser.loadImage(forKey: "imagePrilesKeySaved")
        }
      
    }
}

struct TabBarViewCustems_Previews: PreviewProvider {
    static var previews: some View {
        TabBarViewCustems()
            .environmentObject(HealthManger())
            .previewLayout(.sizeThatFits)
    }
}


struct MoldeTabBar: Identifiable {
    let id = UUID().uuidString
    let title: String
    let isActiveTab: Bool
    var tab : tabBarTab
    
}

let moldeTabBar : [MoldeTabBar] =  [

    MoldeTabBar(title: "Home", isActiveTab: false, tab: .HomeFitHub),
    MoldeTabBar(title: "WorkOut", isActiveTab: false, tab: .WorkOut),
    MoldeTabBar(title: "Food", isActiveTab: false, tab: .Food),
    MoldeTabBar(title: "Note", isActiveTab: false, tab: .Note),
    MoldeTabBar(title: "Community", isActiveTab: false, tab: .Community),
        
]

enum tabBarTab {
    case HomeFitHub
    case WorkOut
    case Food
    case Note
    case Community
}


