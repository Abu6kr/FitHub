//
//  CommunityView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 08.01.2024.
//

import SwiftUI

struct CommunityView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    VStack {
                        NavigationTobBarView(nameView: "Community", SectionIcone: .Community, ShoeImage: false)
                    }
                }
            }
        }
    }
}

#Preview {
    CommunityView()
}
