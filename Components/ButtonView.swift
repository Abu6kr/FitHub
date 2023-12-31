//
//  ButtonView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 28.12.2023.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let background: Color
    let foregroundStyle: Color
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 18,weight: .semibold))
                .foregroundStyle(foregroundStyle)
        }
            .frame(maxWidth: .infinity)
            .frame(height: 53)
            .background(background)
            .clipShape(.rect(cornerRadius: 14))
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Continue", background: Color.themeView.Coloraccent, foregroundStyle:Color.theme.Colorblack)
            .padding(.all)
            .previewLayout(.sizeThatFits)
        
    }
}
