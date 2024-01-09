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
       
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}



