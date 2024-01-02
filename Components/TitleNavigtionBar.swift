//
//  TitleNavigtionBar.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 02.01.2024.
//

import SwiftUI

struct TitleNavigtionBar<Content>: View where Content: View {
    let content: Content
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let title: String
    let description: String
    var body: some View {
        VStack(alignment: .leading,spacing: 8) {
            HStack {
                Text(title)
                    .font(.system(size: 24,weight: .semibold))
                    .foregroundStyle(Color.themeView.secondaryText)
                Spacer()
               
                NavigationLink {
                    content
                } label: {
                    Text("Show All")
                        .font(.system(size: 16,weight: .regular))
                        .foregroundStyle(Color.themeView.Coloraccent)
                }

          
            }
            Text(description)
                .font(.system(size: 14,weight: .regular))
                .foregroundStyle(Color.gray)
      

           
        }
    }
}

struct TitleNavigtionBar_Previews: PreviewProvider {
    static var previews: some View {
        TitleNavigtionBar(content: Text("home"), title: "New Meditations", description: "Inspiring workouts with entire playlists from your favourite artists")
            .padding(.all)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}

