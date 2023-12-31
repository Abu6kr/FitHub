//
//  PLusMinusButton.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 30.12.2023.
//

import SwiftUI

struct PLusMinusButton: View {
    @State var SectionPLusMinus : PLusMinus
    var body: some View {
        ZStack {
            switch SectionPLusMinus {
            case .Minus:
                Image(systemName: "minus")
                    .resizable()
                    .frame(width: 24, height: 4)
                    .foregroundStyle(Color.themeView.background)
                    .font(.system(size: 17,weight: .regular))
                    .frame(width: 50, height: 50)
                    .background(Color(red: 0.827, green: 0.273, blue: 0.341))
                    .clipShape(Circle())
                       
            case .PLus:
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(Color.themeView.background)
                    .font(.system(size: 17,weight: .regular))
                    .frame(width: 50, height: 50)
                    .background(Color(red: 0.827, green: 0.273, blue: 0.341))
                    .clipShape(Circle())
                                
            }
        }
          
    }
}

struct PLusMinusButton_Previews: PreviewProvider {
    static var previews: some View {
        PLusMinusButton(SectionPLusMinus: .Minus)
            .padding(.all)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}




enum PLusMinus {
    case Minus
    case PLus
}
