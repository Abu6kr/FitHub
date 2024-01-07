//
//  WaterDataView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 06.01.2024.
//

import SwiftUI
import SwiftData

struct WaterDataView: View {
    
    
    @State private var percent = 0

    let columns = [
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
        
    ]
    @State private var ListWther: [String] = []
    
    @State private var DrinkWather: Int = 0
    
    @State private var onDelete: Bool = false
    @State private var SectionwatherStlys: watherStlys = .Cup
    
    var body: some View {
        VStack {
          
           
            CircleWaveView(percent: Int(self.DrinkWather))
                .frame(height: 250)
                .padding(.all)
          
//                ForEach(moldeWather) { wathr in
//                    HStack {
//                        Text(wathr.DrinkWather)
//                            .foregroundStyle(Color.white)
//                        switch SectionwatherStlys {
//                        case .Cup:
//                            Image("Cup")
//                                .resizable()
//                                .frame(width: 20,height: 30)
//                        case .bottle:
//                            Image("bottle")
//                                .resizable()
//                                .frame(width: 20,height: 30)
//                        }
//
//               
//                        Spacer()
//                    }
//                }.onDelete(perform: removeRows)
//                    .padding(.horizontal)
         
            
          
         
//            HStack {
//                TextField("Wather", value: $DrinkWather,formatter: NumberFormatter())
//                    .foregroundStyle(Color.white)
//                Spacer()
//                if DrinkWather != 0 {
//                    Button(action: {
//                       
//                    }) {
//                        Text("add")
//                    }
//                }
//            }
//                .padding(.all)
//                .background(Color.themeView.background2)
//                .clipShape(.rect(cornerRadius: 22))
//                .padding(.all)
            
            SectionaddWater
        }
        
    }
    func removeRows(at offsets: IndexSet) {
        ListWther.remove(atOffsets: offsets)
    }
    

}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea(.all)
        WaterDataView()
            .preferredColorScheme(.dark)
    }
}

enum watherStlys {
    case Cup
    case bottle
}





extension WaterDataView {
    
    private var SectionaddWater: some View {
        VStack {
            
            LazyVGrid(columns: columns,alignment: .center){
                Button(action: {
                    ListWther.append(String(0.236588))
                }){
                    HStack {
                        Image("Cup")
                            .resizable()
                            .frame(width: 20,height: 30)
                        Text("Cubs")
                            .foregroundStyle(Color.themeView.activityValueText)
                    }.padding(.all)
                        .frame(height: 50)
                        .background(Color.themeView.background2)
                        .clipShape(.rect(cornerRadius: 10))
                }
          
                Button(action: {
                    ListWther.append(String(1))
                }) {
                    HStack {
                        Image("bottle")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 10,height: 40)
                        Text("bottle")
                            .foregroundStyle(Color.themeView.activityValueText)
                    }.padding(.all)
                        .frame(height: 50)
                        .background(Color.themeView.background2)
                        .clipShape(.rect(cornerRadius: 10))
                        .padding(.horizontal)
                }
          
            }
       
        }
    }
    
}



struct Wave: Shape {

    var offset: Angle
    var percent: Double
    
    var animatableData: Double {
        get { offset.degrees }
        set { offset = Angle(degrees: newValue) }
    }
    
    func path(in rect: CGRect) -> Path {
        var p = Path()

        // empirically determined values for wave to be seen
        // at 0 and 100 percent
        let lowfudge = 0.02
        let highfudge = 0.98
        
        let newpercent = lowfudge + (highfudge - lowfudge) * percent
        let waveHeight = 0.015 * rect.height
        let yoffset = CGFloat(1 - newpercent) * (rect.height - 4 * waveHeight) + 2 * waveHeight
        let startAngle = offset
        let endAngle = offset + Angle(degrees: 360)
        
        p.move(to: CGPoint(x: 0, y: yoffset + waveHeight * CGFloat(sin(offset.radians))))
        
        for angle in stride(from: startAngle.degrees, through: endAngle.degrees, by: 5) {
            let x = CGFloat((angle - startAngle.degrees) / 360) * rect.width
            p.addLine(to: CGPoint(x: x, y: yoffset + waveHeight * CGFloat(sin(Angle(degrees: angle).radians))))
        }
        
        p.addLine(to: CGPoint(x: rect.width, y: rect.height))
        p.addLine(to: CGPoint(x: 0, y: rect.height))
        p.closeSubpath()
        
        return p
    }
}

struct CircleWaveView: View {
    
    @State private var waveOffset = Angle(degrees: 0)
    let percent: Int
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Text("\(self.percent)%")
                    .foregroundColor(.themeView.activityValueText)
                    .font(Font.system(size: 0.25 * min(geo.size.width, geo.size.height) ))
                Rectangle()
                    .stroke(Color.blue.opacity(0.2), lineWidth: 0.025 * min(geo.size.width, geo.size.height))
                    .clipShape(.rect(cornerRadius: 5))
                    .overlay(
                        Wave(offset: Angle(degrees: self.waveOffset.degrees), percent: Double(percent)/100)
                            .fill(Color(red: 0, green: 0.5, blue: 0.75, opacity: 0.5))
                            .clipShape(.rect(cornerRadius: 10).scale(0.92))
                    )
                    
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .onAppear {
            withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
            self.waveOffset = Angle(degrees: 360)
            }
        }
    }
}
