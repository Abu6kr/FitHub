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

    
    @State private var sectionTabBar: tabBarTab = .FitHub
    @State private var  playRun: Bool = false
    
    //MARK: FitHub Icone
    @State var run: Bool = false
    @State var runbac: Bool = false
    
    //MARK: Shereing Icone
    @State var Shere: Bool = false
    @State var ShereBac: Bool = false
    
    //MARK: Summary Icone
    @State var Summary: Bool = false
    @State var SummaryBac: Bool = false
    
    var body: some View {
        ZStack {
            
            Group {
                switch sectionTabBar {
                case .Summary:
                    SummaryView()
                case .FitHub:
                    FitHubView()
                        .environmentObject(healthManger)
                case .Sharing:
                    SharingView()
                }
            }
            
            
            TabView {
                HStack(alignment: .center) {
                    
                    SummaryIcon
                        .padding(.leading,40)
                    
                    Spacer()
                    
                    runFitHubIcon
                    
                    Spacer()
                        FindesShereIcon
                            .padding(.trailing,40)
                    
                }.padding(.top,10)
                .frame(height: 64)
                .background(Color.themeView.background2)
                
            }.tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: 84)
                .clipShape(.rect(cornerRadius: 22))
                .frame(maxHeight: .infinity,alignment: .bottom)
                .offset(y: 6)
                .ignoresSafeArea()

        }
    }
}

struct TabBarViewCustems_Previews: PreviewProvider {
    static var previews: some View {
        TabBarViewCustems()
            .environmentObject(HealthManger())
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}







extension TabBarViewCustems {
    
    
    private var SummaryIcon: some View {
        VStack {
            Button(action: {
                sectionTabBar = .Summary
                if sectionTabBar == .Summary {
                    withAnimation(.easeInOut(duration: 0.50)) {
                        Summary = true
                        SummaryBac = true
                        if SummaryBac == true {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                Summary = false
                                SummaryBac = false
                            }
                        }
                    }
                }
            }){
                VStack(alignment: .center,spacing: 4) {
                    ZStack {
                        if sectionTabBar == .Summary {
                            RingView(
                                percentage: 2,
                                backgroundColor: Color.themeView.Coloraccent.opacity(0.2),
                                startColor: Color.themeView.Coloraccent.opacity(0.6),
                                endColor: Color.themeView.Coloraccent,
                                thickness: 2
                            )
                        } else {
                            RingView(
                                percentage: 2,
                                backgroundColor: Color.gray,
                                startColor: Color.gray,
                                endColor: Color.gray,
                                thickness: 2
                            )
                        }
                    }.frame(width: 23, height: 23)
                    Text("Summary")
                        .font(.system(size: 12,weight: .regular))
                        .foregroundStyle(sectionTabBar == .Summary ? Color.themeView.Coloraccent : Color.gray)
                }
            }
        }
       
    }
    
    private var FindesShereIcon: some View {
        VStack {
            Button(action: {
                sectionTabBar = .Sharing
                if sectionTabBar == .Sharing {
                    withAnimation(.easeInOut(duration: 1.10)) {
                        Shere = true
                        ShereBac = true
                        if ShereBac == true {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                withAnimation(.easeInOut(duration: 1.10)) {
                                    ShereBac = false
                                    run = false
                                }
                            }
                        }
                    }
                }
            }){
                VStack(alignment: .center,spacing: 4) {
                    ZStack {
                        if ShereBac == true {
                            Image(systemName: "person.line.dotted.person.fill")
                                .font(.system(size: 15))
                        } else {
                            Image(systemName: "person.2.fill")
                                .font(.system(size: 15))
                        }
                    }
                    Text("Sharing")
                        .font(.system(size: 12,weight: .regular))
                } .foregroundStyle(sectionTabBar == .Sharing ? Color.themeView.Coloraccent : Color.gray )
            }
        }
    }
    
    private var runFitHubIcon: some View {
        VStack {
            Button(action: {
                sectionTabBar = .FitHub
                if sectionTabBar == .FitHub {
                    withAnimation(.easeInOut(duration: 1.10)) {
                        run = true
                        runbac = true
                        if runbac == true {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                runbac = false
                                run = false
                            }
                        }
                    }
                }
            }){
                VStack(alignment: .center,spacing: 4) {
                    ZStack {
                        Image(systemName: "figure.run")
                            .offset(x: runbac ? 50 : 0)
                            .foregroundStyle(Color.black)
                        Image(systemName: "figure.run")
                            .offset(x: run ? 0 : -50)
                            .foregroundStyle(Color.black)
                    }.font(.system(size: 10))
                        .frame(width: 24.5,height: 24.5)
                        .background(sectionTabBar == .FitHub ? Color.themeView.Coloraccent : Color.gray)
                        .clipShape(Circle())
                    Text("FitHub+")
                        .font(.system(size: 12,weight: .regular))
                        .foregroundStyle(sectionTabBar == .FitHub ? Color.themeView.Coloraccent : Color.gray )
                }
            }
        }
       
    }
    
    
}



enum tabBarTab {
    case Summary
    case FitHub
    case Sharing
}
