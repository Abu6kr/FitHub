//
//  FoodScannerView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 29.12.2023.
//

import SwiftUI


struct FoodScannerView: View {
    @State private var scannedImage: UIImage? // Variable to store the scanned image
    @State private var showScanner: Bool = false // Boolean to control the scanner view
    var body: some View {
        ZStack {
            Color.themeView.background.ignoresSafeArea(.all)
            VStack {
                
                ButtonBackward(sectionIcone: .xmark)
                
                ScannerView(scannedImage: self.$scannedImage)

            }.navigationBarBackButtonHidden(true)
        }
        .sheet(isPresented: $showScanner) {
            if scannedImage != nil {
                Image(uiImage: scannedImage!)
                    .resizable()
                    .scaledToFit()
            } else {
                Text("No image scanned yet")
            }
        }
        .onAppear { scanerImages() }
        
    }
    func scanerImages() {
        if scannedImage != nil {
            showScanner = true
        }
    }
}

#Preview {
    FoodScannerView()
}




