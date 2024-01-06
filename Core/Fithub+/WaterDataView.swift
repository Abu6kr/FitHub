//
//  WaterDataView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 06.01.2024.
//

import SwiftUI

struct WaterDataView: View {
    
    
    @State private var percent = 50.0

    let columns = [
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
    ]
    
    var body: some View {
        VStack {
            
            CircleWaveView(percent: Int(self.percent))
                .frame(height: 250)
                .padding(.all)
            
            SectionaddWater
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea(.all)
        WaterDataView()
    }
}

extension WaterDataView {
    
    private var SectionaddWater: some View {
        VStack {
            HStack {
                Slider(value: self.$percent, in: 0...100)
                    .foregroundStyle(Color.themeView.activityValueText)
            }.padding(.all)
            .background(Color.themeView.background2)
            .clipShape(.rect(cornerRadius: 10))
            .padding(.horizontal)
            
            LazyVGrid(columns: columns,alignment: .center){
                ForEach(0 ..< 5) { item in
                    HStack {
                        Text("1,5")
                            .foregroundStyle(Color.themeView.activityValueText)
                    }.padding(.all)
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
