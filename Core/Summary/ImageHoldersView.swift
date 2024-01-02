//
//  ImageHoldersView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 02.01.2024.
//

import SwiftUI

struct ImageHoldersView: View {
    
    @State private var moveHolderImages: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    ForEach(0..<5){ image in
                        Image("")
                            .resizable()
                            .frame(width: 239, height: 138)
                            .background(Color.red)
                            .clipShape(.rect(cornerRadius: 4))
                            .offset(x: 50)
                        .offset(x: moveHolderImages ? 290 : -390)
                    }
                }
                HStack {
                    ForEach(0..<5){ image in
                        Image("")
                            .resizable()
                            .frame(width: 239, height: 138)
                            .background(Color.red)
                            .clipShape(.rect(cornerRadius: 4))
                            .offset(x: 50)
                            .offset(x: moveHolderImages ? -290 : 190)
                    }
                }
                HStack {
                    ForEach(0..<5){ image in
                        Image("")
                            .resizable()
                            .frame(width: 239, height: 138)
                            .background(Color.red)
                            .clipShape(.rect(cornerRadius: 4))
                            .offset(x: 50)
                            .offset(x: moveHolderImages ? 390 : -290)
                    }
                }
                HStack {
                    ForEach(0..<5){ image in
                        Image("")
                            .resizable()
                            .frame(width: 239, height: 138)
                            .background(Color.red)
                            .clipShape(.rect(cornerRadius: 4))
                            .offset(x: 50)
                            .offset(x: moveHolderImages ? -190 : 290)
                    }
                }
                HStack {
                    ForEach(0..<5){ image in
                        Image("")
                            .resizable()
                            .frame(width: 239, height: 138)
                            .background(Color.red)
                            .clipShape(.rect(cornerRadius: 4))
                            .offset(x: -50)
                            .offset(x: moveHolderImages ? -190 : 190)
                    }
                }
                HStack {
                    ForEach(0..<5){ image in
                        Image("")
                            .resizable()
                            .frame(width: 239, height: 138)
                            .background(Color.red)
                            .clipShape(.rect(cornerRadius: 4))
                            .offset(x: 90)
                            .offset(x: moveHolderImages ? 290 : -390)
                    }
                }
                HStack {
                    ForEach(0..<5){ image in
                        Image("")
                            .resizable()
                            .frame(width: 239, height: 138)
                            .background(Color.red)
                            .clipShape(.rect(cornerRadius: 4))
                            .offset(x: -90)
                            .offset(x: moveHolderImages ? -290 : 290)
                    }
                }
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 8).repeatForever()){
                moveHolderImages.toggle()
            }
        }
    }
}

#Preview {
    ImageHoldersView()
}
