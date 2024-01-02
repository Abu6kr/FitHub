//
//  Summary.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 02.01.2024.
//

import SwiftUI

struct Summary: View {
    @ObservedObject var vmUser = UserInfoViewModel()
    // MARK: - Properties
    
    var safeArea: EdgeInsets
    var size: CGSize
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                // MARK: - Artwork
                Artwork()
                // Since We ignored Top Edge
                GeometryReader{ proxy in
                    let minY = proxy.frame(in: .named("SCROLL")).minY - safeArea.top
                }
                .frame(height: 50)
                .padding(.top, -34)
                .zIndex(1)
                
                VStack {

                    // MARK: - Album View
                    AlbumView()
                }
                .padding(.top, 10)
                .zIndex(0)
                
            }
            .overlay(alignment: .top) {
                HeaderView()
            }
            
        }
        .coordinateSpace(name: "SCROLL")
    }
    
    @ViewBuilder
    func Artwork() -> some View {
        let height = size.height * 0.45
        GeometryReader{ proxy in
            
            let size = proxy.size
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let progress = minY / (height * (minY > 0 ? 0.5 : 0.8))
            
            ImageHoldersView()

                .frame(width: size.width, height: size.height + (minY > 0 ? minY : 0 ))
                .clipped()
                .overlay(content: {
                    ZStack(alignment: .bottom) {
                        
                        // MARK: - Gradient Overlay
                        Rectangle()
                            .fill(
                                .linearGradient(colors: [
                                    .black.opacity(0 - progress),
                                    .black.opacity(0.1 - progress),
                                    .black.opacity(0.3 - progress),
                                    .black.opacity(0.5 - progress),
                                    .black.opacity(0.8 - progress),
                                    .black.opacity(1),
                                ], startPoint: .top, endPoint: .bottom)
                            )
                        VStack(spacing: 0) {
                            Text("Summary")
                                .font(.system(size: 45))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                            
                            Text("Train your body and mind with workouts and meditations designed for all levels.")
                                .font(.system(size: 16, weight: .regular))                               .multilineTextAlignment(.center)
                                .foregroundColor(.gray)
                                .padding(.top, 15)
                        }
                        .opacity(1 + (progress > 0 ? -progress : progress))
                        .padding(.bottom, 55)
                        
                        // Moving with Scroll View
                        
                        .offset(y: minY < 0 ? minY : 0 )
                    }
                })
                .offset(y: -minY)
            
        }
        .frame(height: height + safeArea.top )
    }
    
    @ViewBuilder
    func AlbumView() -> some View {
        VStack(spacing:  25) {
            VStack {
                ForEach(0 ..< 5) { item in
                    TimeToWalkView()
                }
            }.foregroundStyle(Color.white)
        }
    }
    
    // MARK: - Header View
    @ViewBuilder
    func HeaderView() -> some View {
        GeometryReader{ proxy in
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let height = size.height * 0.45
            let progress = minY / (height * (minY > 0 ? 0.5 : 0.8))
            let titleProgress =  minY / height
            
            HStack(spacing: 15) {

                Spacer(minLength: 0)

            }
            .overlay(content: {
                Text("Summary")
                    .fontWeight(.semibold)
                    .offset(y: -titleProgress > 0.75 ? 0 : 45)
                    .clipped()
                    .animation(.easeOut(duration: 0.25), value: -titleProgress > 0.75)
            })
            .padding(.top, safeArea.top + 10)
            .padding([.horizontal,.bottom], 15)
            .background(
                Color.black
                    .opacity(-progress > 1 ? 1 : 0)
            )
            .offset(y: -minY)
        }
        .frame(height: 35)
    }
}


