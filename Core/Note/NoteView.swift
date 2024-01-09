//
//  NoteView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 09.01.2024.
//

import SwiftUI

struct NoteView: View {
   @ObservedObject var vmUser = UserInfoViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    NavigationTobBarView(nameView: "Note", SectionIcone: .Note, ShoeImage: false)
                }
            }
        }
    }
}

#Preview {
    NoteView()
}
