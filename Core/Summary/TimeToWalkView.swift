//
//  TimeToWalkView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 02.01.2024.
//

import SwiftUI

struct TimeToWalkView: View {
    var body: some View {
        VStack  {
            TitleNavigtionBar(content: Text("home"), title: "New Meditations", description: "Inspiring workouts with entire playlists from your favourite artists").padding(.horizontal,22).padding(.bottom,17)
            ScrollView(.horizontal,showsIndicators: false) {
                HStack (spacing: 10){
                    ForEach(0 ..< 5) { item in
                        Image("")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 346,height: 230)
                            .background(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(Color.theme.Gray03)
                            )
                            .background(Color.black)
                            .clipShape(.rect(cornerRadius: 4))
                    }
                }.padding(.leading,22)
            }.padding(.bottom,22)
            Divider()

        }
    }
}

#Preview {
    NavigationStack {
        TimeToWalkView()
    }
}
