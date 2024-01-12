//
//  FitHubView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 28.12.2023.
//

import SwiftUI
import Charts



struct FitHubView: View {
    
    @State var showScanner: Bool = false
    @State private var showfullScaner: Bool = false
    @State private var Search: String = ""
    
    @State private var SectionTabFood: TabBarFood = .food
    
    @ObservedObject var vmUser = UserInfoViewModel()
    @EnvironmentObject var healthManger :  HealthManger
    
    let columns = [
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
    ]
    
    
    let measurement = [
         Measurement(id: "0", date: 0.0, amount: 40.0),
         Measurement(id: "1", date: 2.0, amount: 25.0),
         Measurement(id: "2", date: 4.0, amount: 22.0),
         Measurement(id: "3", date: 6.0, amount: 38.0),
         Measurement(id: "4", date: 8.0, amount: 45.0),
         Measurement(id: "5", date: 10.0, amount: 30.0),
         Measurement(id: "6", date: 14.0, amount: 26.0)
     ]
     
     @State var selected = "0"
    
    func tapSymbol(at location: CGPoint, proxy: ChartProxy, geometry: GeometryProxy) {
         let xPos = location.x - geometry[proxy.plotAreaFrame].origin.x
         let yPos = location.y - geometry[proxy.plotAreaFrame].origin.y
         if let pos: (Double, Double) = proxy.value(at: CGPoint(x: xPos, y: yPos)) {
             let results = measurement.filter{ $0.isAround(x: pos.0, y: pos.1) }
             if let firstId = results.first?.id {
                 selected = firstId
             }
         }
     }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.themeView.background.ignoresSafeArea(.all)
                ScrollView {
                    VStack {
                        
                        NavigationTobBarView(nameView: "HomeFit", SectionIcone: .HomeFitHub, ShoeImage: true)
                    
                        TabBarHomeNavigtion

                        ChartPicerDateColer
                        
                        LazyVGrid(columns: columns,alignment: .center){
                            
                            Wather
                            
                            ForEach(healthManger.activtys.sorted(by: {$0.value.id < $1.value.id}), id: \.key) { item in
                                    ActivtyCstmesView(activty: item.value)
                            }
                        }.padding(.top)
                  
                        
                        VStack(alignment: .leading) {
                            Text("Traing Workouts")
                                .font(.system(size: 15,weight: .regular))
                                .padding(.init(top: 16, leading: 10, bottom: 10, trailing: 16))
                            
                            TabBarVidewCutems()
                            
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Daily Task")
                                .font(.system(size: 15,weight: .regular))
                                .padding(.init(top: 16, leading: 10, bottom: 10, trailing: 16))
                            
                            DailyTaskView()
                        }
                        
                        
                    }.padding(.bottom,150)
                }
            }
            
            .onAppear {
                vmUser.loadImage(forKey: "imagePrilesKeySaved")
                healthManger.fatechTodaySteps()
                healthManger.fatechTodayCalores()
                vmUser.exteactCuetData()
            }

        }
    }
}

#Preview {
    FitHubView()
        .environmentObject(HealthManger())
        .environmentObject(UserInfoViewModel())
}




struct Measurement: Identifiable {
    var id: String
    var date: Double
    var amount: Double
    
    static let dx: CGFloat = 0.5  // <--- adjust as required
    static let dy: CGFloat = 2.0  // <--- adjust as required
    
    func isAround(x: CGFloat, y: CGFloat) -> Bool {
        return date <= (x + Measurement.dx) && date >= (x - Measurement.dx) && amount <= (y + Measurement.dy) && amount >= (y - Measurement.dy)
    }
}


extension FitHubView {
    
    
    private var TabBarHomeNavigtion: some View {
        VStack {
            HStack {
                Text("Workouts Plan")
                    .font(.system(size: 18,weight: .regular))
                Spacer()
                Text("May")
                    .font(.system(size: 15,weight: .regular))
                Image(systemName: "chevron.down")
                    .font(.system(size: 15,weight: .regular))
            }.padding(.init(top: 10, leading: 10, bottom: 0, trailing: 10))
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: 5) {
                
                    ForEach(vmUser.cruuentWeek,id: \.self) { data in
                        VStack {
                            Text(vmUser.extracDate(date: data).prefix(1))
                                .font(.system(size: 14,weight:.regular))
                                .foregroundStyle(vmUser.isSameDay(date1:vmUser.cruuentDay , date2: data) ? Color.white :  Color.gray)
                            Text(vmUser.getDateFormat(date: data))
                                .font(.system(size: 18,weight: .regular))
                        }
                            .foregroundStyle(vmUser.isSameDay(date1:vmUser.cruuentDay , date2: data) ? Color.white :  Color.black)
                            .multilineTextAlignment(.center)
                            .padding(.all,10)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(Color.theme.Gray03.opacity(0.4))
                            )
                            .background(vmUser.isSameDay(date1:vmUser.cruuentDay , date2: data) ? Color.black :  Color.white)
                            .clipShape(.rect(cornerRadius: 20))
                            .frame(width: 50,height: 90)
                            .onTapGesture {
                                withAnimation {
                                    vmUser.cruuentDay = data
                                }
                            }

                    }
                }.padding(.horizontal,10)
            }
        }
    }
    
    private var ChartPicerDateColer: some View {
        VStack(alignment: .leading,spacing: 20) {
            Text("Your daliy health statices")
                .font(.system(size: 15,weight: .regular))
            
            Chart {
                ForEach(measurement) { chartItem in
                    AreaMark(
                        x: .value("Date", chartItem.date),
                        y: .value("Amount", chartItem.amount)
                    )  .foregroundStyle(Color(red: 0.702, green: 0.025, blue: 0.673).opacity(0.07))
                    LineMark(
                        x: .value("Date", chartItem.date),
                        y: .value("Amount", chartItem.amount)
                    )  .foregroundStyle(Color(red: 0.702, green: 0.025, blue: 0.673))
                    .symbol {
                        Circle().fill(selected == chartItem.id ? Color.white : Color.red).opacity(0.6).frame(width: 10)
                    }
                }
            }
                .chartOverlay { proxy in
                GeometryReader { geometry in
                    ZStack(alignment: .top) {
                        Rectangle().fill(.clear).contentShape(Rectangle())
                            .onTapGesture { location in
                                tapSymbol(at: location, proxy: proxy, geometry: geometry)
                            }
                    }
                }
            }
            .frame(height: 150)
            
        }.padding(.all,10)
    }

    private var TabBarCamer: some View {
        VStack {
            HStack {
                HStack {
                    TextField("Search", text: $Search)
                    if !Search.isEmpty {
                        Button(action: {Search = ""}){
                            Image(systemName: "xmark.circle.fill")
                        }
                    }
                }
                .padding(.all,10)
                .background(Color.theme.Gray02)
                .clipShape(.rect(cornerRadius: 10))
                Button(action: {self.showfullScaner.toggle()}) {
                    ZStack {
                        Image(systemName: "camera")
                            .padding(8)
                            .background(Color.gray)
                            .clipShape(.circle)
                        
                        Image("scanerCode")
                            .foregroundStyle(Color.themeView.secondaryText)
                        
                    }
                }
            }.padding(.all,10)
            Spacer()
        }.padding(.top,10)
            .frame(height: 120)
            .frame(maxWidth: .infinity)
            .background(Color.themeView.background2)
            .cornerRadius(22, corners: [.topLeft,.topRight])
            .frame(maxHeight: .infinity,alignment:.bottom)
            .offset(y: showScanner ? 0 : 600)
            .opacity(showScanner ? 1 : 0)
            .fullScreenCover(isPresented: $showfullScaner){ FoodScannerView() }
    }
    
    private var Wather: some View {
        VStack(alignment: .leading) {
            
            VStack(alignment: .leading) {
                Text("Wather")
                    .font(.system(size: 15,weight: .regular))
                    .foregroundStyle(Color.black)
            }
            Spacer()
            VStack(alignment: .leading,spacing: 10) {
                
                Text("95")
                    .foregroundStyle(Color.black)
                    .font(.system(size: 25,weight: .regular))
                
                Image("Cup")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20,height: 20)
                    .foregroundStyle(Color.gray)
                    .padding(.leading,5)
          
            }.frame(maxWidth: .infinity,alignment: .leading)
                .padding(.vertical,8)
            
        }.padding(.all,10)
            .frame(maxWidth: .infinity)
            .frame(height: 150)
            .padding(.all,5)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 1)
                    .foregroundColor(Color.gray.opacity(0.4))
            )
            .background(Color(red: 0.957, green: 0.957, blue: 0.957))
            .clipShape(.rect(cornerRadius: 20))
            .padding(.horizontal,10)

    }

    
    
}

