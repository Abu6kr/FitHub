//
//  TabBarVidewCutems.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 10.01.2024.
//

import SwiftUI

struct TabBarVidewCutems: View {
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack {
                ForEach(0 ..< 5) { item in
                    ZStack {
                        Image("VidewOnew")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 360,height: 190)
                            .offset(y: -10)
                        LinearGradient(colors: [Color.black.opacity(0.4),Color.black.opacity(0.7)], startPoint: .top, endPoint: .bottom)
                            .ignoresSafeArea()
                        
                        VStack(alignment: .leading,spacing: 5) {
                            Spacer()
                            Text("45 min")
                            Text("120 kcal")
                            Text("7:30 - 8:15 am")
                            HStack {
                                Text("Shoulder Blacster")
                                    .font(.system(size: 22,weight: .regular))
                                Spacer()
                                Button(action: {}) {
                                    Image(systemName: "play.circle.fill")
                                        .font(.system(size: 30,weight: .bold))
                                        .foregroundStyle(Color.black, Color.white)
                                }
                            }.foregroundStyle(Color.white)
                        }.padding(.all)
                            .font(.system(size: 15,weight: .light))
                            .foregroundStyle(Color.gray)
                    }.frame(width: 360,height: 190)
                        .background(Color.red)
                        .clipShape(.rect(cornerRadius: 20))
                }
            }.padding(.leading, 10)
        }
          
    }
}


struct TabBarVidewCutems_Previews: PreviewProvider {
    static var previews: some View {
        TabBarVidewCutems()
            .previewLayout(.sizeThatFits)
    }
}
