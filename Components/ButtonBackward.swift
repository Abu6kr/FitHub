//
//  ButtonBackward.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 29.12.2023.
//

import SwiftUI

struct ButtonBackward: View {
    @Environment(\.dismiss) var dismissView
    @State var sectionIcone: sectionIcone
    var body: some View {
        Button(action: { self.dismissView()}) {
            switch sectionIcone {
            case .backward:
                Image(systemName: "chevron.backward")
                    .font(.system(size: 17,weight: .regular))
            case .xmark:
                Image(systemName: "xmark")
                    .font(.system(size: 17,weight: .regular))
                
            }
          
        }.frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal)
    }
}


struct ButtonBackward_Previews: PreviewProvider {
    static var previews: some View {
        ButtonBackward(sectionIcone: .xmark)
            .padding(.all)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}

enum sectionIcone {
    case backward
    case xmark
}
