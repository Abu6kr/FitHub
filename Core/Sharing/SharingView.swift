//
//  SharingView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 28.12.2023.
//

import SwiftUI

struct SharingView: View {
    @AppStorage("GetStart") var GetStart: Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
                Color.themeView.background.ignoresSafeArea(.all)
                VStack {
                    
                    if GetStart == true { SharingAddView()
                    } else { GetStartedShereView(getSarte: $GetStart) }
                   
                }
            }
        }
    }
}

#Preview {
    SharingView()
        .preferredColorScheme(.dark)
}
