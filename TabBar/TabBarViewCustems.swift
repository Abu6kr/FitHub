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
                    Text("Note")
                case .Community:
                    CommunityView()
                }
            }
            
            VStack {
                HStack(alignment: .center,spacing: 20) {
                    ForEach(moldeTabBar){ items in
                        Button(action: {
                            sectionTabBar = items.tab
                            isActiveTab = items.isActiveTab
                        }){
                            ZStack {
                                Text(items.title)
                                    .font(.system(size: 14,weight: .light))
                                    .foregroundStyle(sectionTabBar == items.tab ? Color.red : Color.black)
                            }
                        }
                    }
                }.padding(.horizontal)
                    .frame(height: 54)
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(Color.theme.Gray03.opacity(0.2))
                    )
                    .background(Color.themeView.background)
                    .clipShape(.rect(cornerRadius: 30))
                    .padding(.horizontal)
            }.frame(maxHeight:.infinity,alignment: .bottom)

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







extension TabBarViewCustems {
    
    
//    private var SummaryIcon: some View {
//        VStack {
//            Button(action: {
//                sectionTabBar = .Summary
//                if sectionTabBar == .Summary {
//                    withAnimation(.easeInOut(duration: 0.50)) {
//                        Summary = true
//                        SummaryBac = true
//                        if SummaryBac == true {
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                                Summary = false
//                                SummaryBac = false
//                            }
//                        }
//                    }
//                }
//            }){
//                VStack(alignment: .center,spacing: 4) {
//                    ZStack {
//                        if sectionTabBar == .Summary {
//                            RingView(
//                                percentage: 2,
//                                backgroundColor: Color.themeView.Coloraccent.opacity(0.2),
//                                startColor: Color.themeView.Coloraccent.opacity(0.6),
//                                endColor: Color.themeView.Coloraccent,
//                                thickness: 2
//                            )
//                        } else {
//                            RingView(
//                                percentage: 2,
//                                backgroundColor: Color.gray,
//                                startColor: Color.gray,
//                                endColor: Color.gray,
//                                thickness: 2
//                            )
//                        }
//                    }.frame(width: 23, height: 23)
//                    Text("Summary")
//                        .font(.system(size: 12,weight: .regular))
//                        .foregroundStyle(sectionTabBar == .Summary ? Color.themeView.Coloraccent : Color.gray)
//                }
//            }
//        }
//       
//    }
//    
//    private var FindesShereIcon: some View {
//        VStack {
//            Button(action: {
//                sectionTabBar = .Sharing
//                if sectionTabBar == .Sharing {
//                    withAnimation(.easeInOut(duration: 1.10)) {
//                        Shere = true
//                        ShereBac = true
//                        if ShereBac == true {
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//                                withAnimation(.easeInOut(duration: 1.10)) {
//                                    ShereBac = false
//                                    run = false
//                                }
//                            }
//                        }
//                    }
//                }
//            }){
//                VStack(alignment: .center,spacing: 4) {
//                    ZStack {
//                        if ShereBac == true {
//                            Image(systemName: "person.line.dotted.person.fill")
//                                .font(.system(size: 15))
//                        } else {
//                            Image(systemName: "person.2.fill")
//                                .font(.system(size: 15))
//                        }
//                    }
//                    Text("Sharing")
//                        .font(.system(size: 12,weight: .regular))
//                } .foregroundStyle(sectionTabBar == .Sharing ? Color.themeView.Coloraccent : Color.gray )
//            }
//        }
//    }
//    
//    private var runFitHubIcon: some View {
//        VStack {
//            Button(action: {
//                sectionTabBar = .FitHub
//                if sectionTabBar == .FitHub {
//                    withAnimation(.easeInOut(duration: 1.10)) {
//                        run = true
//                        runbac = true
//                        if runbac == true {
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                                runbac = false
//                                run = false
//                            }
//                        }
//                    }
//                }
//            }){
//                VStack(alignment: .center,spacing: 4) {
//                    ZStack {
//                        Image(systemName: "figure.run")
//                            .offset(x: runbac ? 50 : 0)
//                            .foregroundStyle(Color.black)
//                        Image(systemName: "figure.run")
//                            .offset(x: run ? 0 : -50)
//                            .foregroundStyle(Color.black)
//                    }.font(.system(size: 10))
//                        .frame(width: 24.5,height: 24.5)
//                        .background(sectionTabBar == .FitHub ? Color.themeView.Coloraccent : Color.gray)
//                        .clipShape(Circle())
//                    Text("FitHub+")
//                        .font(.system(size: 12,weight: .regular))
//                        .foregroundStyle(sectionTabBar == .FitHub ? Color.themeView.Coloraccent : Color.gray )
//                }
//            }
//        }
//       
//    }
    
    
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




struct TabBarView: View {
    var tabbarItems: [String]
    
    @State var selectedIndex = 0
    
    var body: some View {
        HStack {
            ForEach(tabbarItems.indices, id: \.self) { index in
                
                Text(tabbarItems[index])
                    .font(.subheadline)
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                    .foregroundColor(selectedIndex == index ? .white : .black)
                    .background(Capsule().foregroundColor(selectedIndex == index ? .purple : .clear))
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            selectedIndex = index
                        }
                    }
            }
            
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(25)
        
    }
}
