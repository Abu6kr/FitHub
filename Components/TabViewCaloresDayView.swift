//
//  TabViewCaloresDayView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 02.01.2024.
//

import SwiftUI

struct TabViewCaloresDayView: View {
    @ObservedObject var vmUser : UserInfoViewModel
    @State private var dayCapes : Int = 1500
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading,spacing: 20) {
                
                Text("Consumed today")
                    .font(.system(size: 15,weight: .regular))
                    .foregroundStyle(Color.themeView.activityValueText)
                
                HStack {
                    Text("\(dayCapes)")
                        .foregroundStyle(Color.themeView.activityValueText)
                    Text("/ \(vmUser.currentUserCaloresDay) Kcal")
                        .foregroundStyle(Color.themeView.activityValueText.opacity(0.5))
                    
                }.font(.system(size: 22,weight: .semibold))
                
                ZStack {
                    Rectangle()
                        .frame(height: 5)
                        .clipShape(.rect(cornerRadius: 10))
                        .foregroundStyle(Color.theme.Red.opacity(0.5))
                    
                    Rectangle()
                        .frame(height: 5)
                        .frame(width: 100)
                        .foregroundStyle(Color.theme.Red)
                        .clipShape(.rect(cornerRadius: 10))
                        .frame(maxWidth: .infinity,alignment:.leading)
                    
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

#Preview {
    ZStack {
        Color.white
        TabViewCaloresDayView(vmUser: UserInfoViewModel())
    }
}



struct ActivtyCstmesView: View {
    @State var activty: Activty
    var body: some View {
        VStack(alignment: .leading) {
            
            VStack(alignment: .leading) {
                Text(activty.title)
                    .font(.system(size: 15,weight: .semibold))
                    .foregroundStyle(Color.white)
            }
            
            HStack {
                ZStack {
                    RingView(
                        percentage: 0.5,
                        backgroundColor: Color.theme.standRingBackground,
                        startColor: Color.theme.standRingStartColor,
                        endColor: Color.theme.standRingEndColor,
                        thickness: 2
                    )
                }.frame(width: 50, height: 50)
              
                Image(systemName: activty.image)
                    .font(.system(size: 18,weight: .regular))
                    .foregroundStyle(Color.green)
                    .padding(.leading,5)
                
                Text(activty.amount)
                    .foregroundStyle(Color.themeView.activityValueText)
                    .font(.system(size: 18,weight: .regular))
            }.frame(maxWidth: .infinity,alignment: .leading)
            
        }.padding(.all,10)
            .frame(maxWidth: .infinity)
            .background(Color.theme.Gray07)
            .clipShape(.rect(cornerRadius: 12))
            .padding(.horizontal,10)
    }
}






//Text(activty.title)
//    .font(Font.system(size: 18, weight: .regular, design: .default))
//    .kerning(0.05)
//    .foregroundColor(Color.white)
//HStack {
//    Image(systemName: activty.image)
//        .font(.system(size: 18,weight: .regular))
//    
//    Text(activty.amount)
//        .font(Font.system(size: 28, weight: .semibold, design: .rounded))
//        .kerning(0.25)
//        .foregroundColor(Color.themeView.activityValueText)
//        .padding([.top], -3)
//}


//struct TabViewSetsDay: View {
//    @ObservedObject var vmUser : UserInfoViewModel
//    @State var activty: Activty
//    @EnvironmentObject var healthManger :  HealthManger
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text("Calores")
//                .font(.system(size: 22,weight: .regular))
//                .foregroundStyle(Color.white)
//                .padding(.leading)
//            ZStack {
//                HStack {
//                    VStack(alignment: .leading,spacing: 20) {
//                        LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) {
//                            ForEach(healthManger.activtys.sorted(by: {$0.value.id < $1.value.id}), id: \.key) { item in
//                                ActivtyCstmesView(activty: item.value)
//                            }
//                        }
//                    }.frame(width: 160, height: 160)
//                        .aspectRatio(contentMode: .fit)
//                    Spacer()
//                }
//            }.padding(.vertical)
//                .frame(maxWidth: .infinity)
//                .frame(height: 230)
//                .background(Color.theme.Gray07)
//                .clipShape(.rect(cornerRadius: 12))
//                .padding(.horizontal,10)
//        }
//    }
//}
//
//#Preview {
//    TabViewSetsDay(vmUser: UserInfoViewModel(), activty: Activty(id: 0, title: "Step Day", subtitle: "7938", image: "", amount: "1000"))
//        .environmentObject(HealthManger())
//}

//                                ActivtyCstmesView(activty: Activty(id: 0, title: "Step Day", subtitle: "7938", image: "figure.walk", amount: "1000"))
//                                ActivtyCstmesView(activty: Activty(id: 0, title: "Step Day", subtitle: "7938", image: "figure.walk", amount: "1000"))
//                                ActivtyCstmesView(activty: Activty(id: 0, title: "Step Day", subtitle: "7938", image: "figure.walk", amount: "1000"))
