//
//  SummaryView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 01.01.2024.
//

import SwiftUI


struct SummaryView: View {
    var body: some View {
        GeometryReader {
            let safeArea = $0.safeAreaInsets
            let size = $0.size
            Summary(safeArea: safeArea, size: size)
                .ignoresSafeArea(.container, edges: .top)
        }
        .preferredColorScheme(.dark)
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}










//struct SummaryView: View {
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                Color.themeView.background.ignoresSafeArea(.all)
//                ScrollView {
//                    VStack {
//
//                        TimeToWalkView()
//                    }
//                }
//            }.navigationTitle("Summary")
//                .navigationBarTitleDisplayMode(.inline)
//        }
//    }
//}

//#Preview {
//    SummaryView()
//        .preferredColorScheme(.dark)
//}
