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
         Measurement(id: "1", date: 2.0, amount: 11.0),
         Measurement(id: "2", date: 4.0, amount: 22.0),
         Measurement(id: "3", date: 6.0, amount: 38.0),
         Measurement(id: "4", date: 8.0, amount: 45.0),
         Measurement(id: "5", date: 10.0, amount: 30.0),
         Measurement(id: "6", date: 12.0, amount: 57.0),
         Measurement(id: "7", date: 14.0, amount: 26.0)
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
                    
                        VStack(alignment: .leading,spacing: 20) {
                            Text("Your daliy health statices")
                                .font(.system(size: 15,weight: .regular))
                            
                            Chart {
                                ForEach(measurement) { chartItem in
                                    AreaMark(
                                        x: .value("Date", chartItem.date),
                                        y: .value("Amount", chartItem.amount)
                                    )  .foregroundStyle(Color(red: 0.702, green: 0.025, blue: 0.673).opacity(0.3))
                                    LineMark(
                                        x: .value("Date", chartItem.date),
                                        y: .value("Amount", chartItem.amount)
                                    )  .foregroundStyle(Color(red: 0.702, green: 0.025, blue: 0.673))
                                    .symbol {
                                        Circle().fill(selected == chartItem.id ? Color.white : Color.red).opacity(0.6).frame(width: 10)
                                    }
                                }
                            }  .chartOverlay { proxy in
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
                        
                        
                        LazyVGrid(columns: columns,alignment: .center){
                            
                            //MARK: Tesing Data How Show
                            ActivtyCstmesView(activty: Activty(id: 0, title: "Step Day", subtitle: "7938", image: "figure.walk", amount: "1000"))
                            ActivtyCstmesView(activty:Activty(id: 0, title: "Today Calories", subtitle: "Goal 900", image: "flame", amount: "1079"))
                            
                            ForEach(healthManger.activtys.sorted(by: {$0.value.id < $1.value.id}), id: \.key) { item in
                                ActivtyCstmesView(activty: item.value)
                            }
                        }.padding(.top)
                  
                        
                        

                        
                    }.padding(.bottom,150)
                }
//                TabBarCamer
                
            }
            
            .onAppear {
                healthManger.fatechTodaySteps()
                healthManger.fatechTodayCalores()
            }

        }
    }
}

#Preview {
    FitHubView()
        .environmentObject(HealthManger())
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
    
    private var TabBarNavigtionCutems: some View {
        VStack {
            HStack {
                NavigationLink {
                    AccountView(vmUser: vmUser)
                } label: {
                    if let image = vmUser.imageProfiles {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .background(Color.red)
                            .clipShape(Circle())
                            .padding(.horizontal)
                    } else if vmUser.imageProfiles == nil {
                        Image("")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .background(Color.theme.Gray02)
                            .clipShape(Circle())
                            .padding(.horizontal)
                    }
                }
                Spacer()

                
                Image(systemName: "bell")
                    .font(.system(size: 15,weight: .regular))
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: .infinity)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color.theme.Gray03.opacity(0.5))
                    )
                    .padding(.horizontal)
            }
            Text("Hey, \(vmUser.currentUserName)")
                .font(.system(size: 22,weight: .regular))
                .padding(.all)
                .frame(maxWidth: .infinity,alignment: .leading)
        }.padding(.vertical)

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

}









func createRings() -> some View {
    HStack {
        VStack {
            Text("Proteins")
                .font(.system(size: 18,weight: .regular))
            ZStack {
                RingView(
                    percentage: 0.9,
                    backgroundColor: Color.theme.moveRingBackground,
                    startColor: Color.theme.moveRingStartColor,
                    endColor: Color.theme.moveRingEndColor,
                    thickness: 10
                )
                Text("1400")
                    .font(.system(size: 16,weight: .regular))
            }
            .frame(width: 100, height: 100)
            .aspectRatio(contentMode: .fit)
        }
        Spacer()
        VStack {
            Text("Carb")
                .font(.system(size: 18,weight: .regular))
            ZStack {
                RingView(
                    percentage: 0.3,
                    backgroundColor: Color.theme.exerciseRingBackground,
                    startColor: Color.theme.exerciseRingStartColor,
                    endColor: Color.theme.exerciseRingEndColor,
                    thickness: 10
                )
                Text("200")
                    .font(.system(size: 16,weight: .regular))
                
            }
            .frame(width: 100, height: 100)
            .aspectRatio(contentMode: .fit)
        }
        Spacer()
        VStack {
            Text("Fats")
                .font(.system(size: 18,weight: .regular))
            ZStack {
                RingView(
                    percentage: 0.5,
                    backgroundColor: Color.theme.standRingBackground,
                    startColor: Color.theme.standRingStartColor,
                    endColor: Color.theme.standRingEndColor,
                    thickness: 10
                )
                Text("40")
                    .font(.system(size: 16,weight: .regular))
            }
            .frame(width: 100, height: 100)
            .aspectRatio(contentMode: .fit)
        }
    }
    .padding(.all)
    .frame(maxWidth: .infinity)
    .background(BlurView(style: .dark))
    
}

func createFooter() -> some View {
    VStack(alignment: .leading, spacing: 0) {

        Divider()
            .background(Color.gray)
            .frame(height: 2)
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 15, trailing: 0))
        Text("Flights Climbed")
            .font(Font.system(size: 18, weight: .regular, design: .default))
            .kerning(0.05)
            .foregroundColor(Color.white)
        Text("4")
            .font(Font.system(size: 28, weight: .semibold, design: .rounded))
            .kerning(0.25)
            .foregroundColor(Color.themeView.activityValueText)
            .padding([.top], -3)
        }
        .padding([.leading], 15)
}
