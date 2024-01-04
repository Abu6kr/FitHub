//
//  TabViewCaloresDayView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 02.01.2024.
//

import SwiftUI

struct TabViewCaloresDayView: View {
    @ObservedObject var vmUser : UserInfoViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Calores")
                .font(.system(size: 22,weight: .regular))
                .foregroundStyle(Color.white)
                .padding(.leading)
            ZStack {
                HStack {
                    VStack(alignment: .leading,spacing: 20) {
                        ZStack {
                            RingView(
                                percentage: Double(vmUser.currentUserCaloresDay),
                                backgroundColor: Color.theme.exerciseRingBackground,
                                startColor: Color.theme.exerciseRingStartColor,
                                endColor: Color.theme.exerciseRingEndColor,
                                thickness: 10
                            )
                            Text("\(vmUser.currentUserCaloresDay)")
                                .font(.system(size: 22,weight: .bold))
                                .foregroundStyle(Color.white)
                        }
                        .frame(width: 160, height: 160)
                        .aspectRatio(contentMode: .fit)
                    }.padding(10)
                    Spacer()
                }
            }.padding(.vertical)
                .frame(maxWidth: .infinity)
                .frame(height: 230)
                .background(Color.theme.Gray07)
                .clipShape(.rect(cornerRadius: 12))
                .padding(.horizontal,10)
        }
    }
}

#Preview {
    ZStack {
        Color.black
        TabViewCaloresDayView(vmUser: UserInfoViewModel())
    }
}



struct TabViewSetsDay: View {
    @ObservedObject var vmUser : UserInfoViewModel
    @State var activty: Activty
    @EnvironmentObject var healthManger :  HealthManger

    var body: some View {
        VStack(alignment: .leading) {
            Text("Calores")
                .font(.system(size: 22,weight: .regular))
                .foregroundStyle(Color.white)
                .padding(.leading)
            ZStack {
                HStack {
                    VStack(alignment: .leading,spacing: 20) {
                            LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) {
                                ForEach(healthManger.activtys.sorted(by: {$0.value.id < $1.value.id}), id: \.key) { item in
                                    ActivtyCstmesView(activty: item.value)
                                }
                            }
                    }.frame(width: 160, height: 160)
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                }
            }.padding(.vertical)
                .frame(maxWidth: .infinity)
                .frame(height: 230)
                .background(Color.theme.Gray07)
                .clipShape(.rect(cornerRadius: 12))
                .padding(.horizontal,10)
        }
    }
}

#Preview {
    TabViewSetsDay(vmUser: UserInfoViewModel(), activty: Activty(id: 0, title: "Step Day", subtitle: "", image: "", amount: "1000"))
        .environmentObject(HealthManger())
}

struct ActivtyCstmesView: View {
    @State var activty: Activty
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(activty.title)
                .font(Font.system(size: 18, weight: .regular, design: .default))
                .kerning(0.05)
                .foregroundColor(Color.white)
            Text(activty.amount)
                .font(Font.system(size: 28, weight: .semibold, design: .rounded))
                .kerning(0.25)
                .foregroundColor(Color.themeView.activityValueText)
                .padding([.top], -3)
            Image(systemName: activty.image)
        }.padding(.all)
        .background(Color.gray.opacity(0.4))
        .clipShape(.rect(cornerRadius: 10))
    }
}
