//
//  AccountView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 31.12.2023.
//

import SwiftUI

struct AccountView: View {
    
    @ObservedObject var vmUser = UserInfoViewModel()
    
    var body: some View {
        ZStack {
            Color.themeView.background.ignoresSafeArea(.all)
            ScrollView {
                List {
                    
                }
            }
        }
    }
}

#Preview {
    AccountView()
}
