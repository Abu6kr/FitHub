//
//  SharingAddView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 28.12.2023.
//

import SwiftUI

struct SharingAddView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.themeView.background.ignoresSafeArea(.all)
                ScrollView {
                    VStack {
                        shereTextActive
                    
                    }
                }
            }.navigationTitle("Sharing")
                .toolbar { ToolbarItemGroup(placement: .primaryAction) { addFindes } }
        }
    }
}

#Preview {
    SharingAddView()
        .preferredColorScheme(.dark)
}







extension SharingAddView {
    
    private var shereTextActive: some View {
        VStack(alignment: .center,spacing: 10) {
          
            Text("Share Activity")
                .font(.system(size: 30,weight: .regular))
            Text("Tap the button above to invite people to share Activity with you.")
                .multilineTextAlignment(.center)
                .font(.system(size: 16,weight: .regular))
                .padding(.horizontal,66)
            
        }.padding(.top,250)
    }
    
    private var addFindes: some View {
        Button(action: {}, label: {
            Image(systemName: "person.crop.circle.badge.plus")
                .foregroundStyle(Color.themeView.Coloraccent)
        })
    }
}
