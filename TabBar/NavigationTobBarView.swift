//
//  NavigationTobBarView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 08.01.2024.
//

import SwiftUI

struct NavigationTobBarView: View {
    @ObservedObject var vmUser = UserInfoViewModel()
    
    var nameView: String
    
    @State var SectionIcone: iconeViewNavigation
    
    @State var ShoeImage: Bool
    
    var body: some View {
        HStack {
            if ShoeImage {
                NavigationLink {
                    AccountView(vmUser: vmUser)
                } label: {
                    if let image = vmUser.imageProfiles {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .background(Color.red)
                            .clipShape(Circle())
                    } else if vmUser.imageProfiles == nil {
                        Image("")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .background(Color.theme.Gray02)
                            .clipShape(Circle())
                    }
                }
            }
       
            Spacer()
                if ShoeImage == false {
                Text(nameView)
                    .font(.system(size: 22,weight: .light))
                    .foregroundStyle(Color.black)
                    .offset(x: 20)
                } else {
                    Text(nameView)
                        .font(.system(size: 22,weight: .light))
                        .foregroundStyle(Color.black)
                }
 
     
            Spacer()
            switch SectionIcone {
            case .HomeFitHub:
                NavigationLink {
                    Text("HomeFitHub")
                } label: {
                    Image(systemName: "bell")
                        .font(.system(size: 17, weight: .regular))
                        .frame(width: 36, height: 36)
                        .foregroundColor(Color.black)
                        .background(Color.white)
                        .backgroundStyle(cornerRadius: .infinity, opacity: 0.4)
                        .padding(.all,3)
                        .background(
                            RoundedRectangle(cornerRadius: .infinity)
                                .stroke(lineWidth: 1)
                                .foregroundColor(Color.gray.opacity(0.4))
                        )
                }
               
            case .WorkOut:
                Image(systemName: "calendar")
                    .font(.system(size: 17, weight: .regular))
                    .frame(width: 36, height: 36)
                    .foregroundColor(Color.black)
                    .background(Color.white)
                    .backgroundStyle(cornerRadius: .infinity, opacity: 0.4)
                    .padding(.all,3)
                    .background(
                        RoundedRectangle(cornerRadius: .infinity)
                            .stroke(lineWidth: 1)
                            .foregroundColor(Color.gray.opacity(0.4))
                    )
                 
            case .Food:
                Image(systemName: "list.bullet")
                    .font(.system(size: 17, weight: .regular))
                    .frame(width: 36, height: 36)
                    .foregroundColor(Color.black)
                    .background(Color.white)
                    .backgroundStyle(cornerRadius: .infinity, opacity: 0.4)
                    .padding(.all,3)
                    .background(
                        RoundedRectangle(cornerRadius: .infinity)
                            .stroke(lineWidth: 1)
                            .foregroundColor(Color.gray.opacity(0.4))
                    )
            case .Note:
                Image(systemName: "plus")
                    .font(.system(size: 17, weight: .regular))
                    .frame(width: 36, height: 36)
                    .foregroundColor(Color.black)
                    .background(Color.white)
                    .backgroundStyle(cornerRadius: .infinity, opacity: 0.4)
                    .padding(.all,3)
                    .background(
                        RoundedRectangle(cornerRadius: .infinity)
                            .stroke(lineWidth: 1)
                            .foregroundColor(Color.gray.opacity(0.4))
                    )
            case .Community:
                Image(systemName: "bell")
                    .font(.system(size: 17, weight: .regular))
                    .frame(width: 36, height: 36)
                    .foregroundColor(Color.black)
                    .background(Color.white)
                    .backgroundStyle(cornerRadius: .infinity, opacity: 0.4)
                    .padding(.all,3)
                    .background(
                        RoundedRectangle(cornerRadius: .infinity)
                            .stroke(lineWidth: 1)
                            .foregroundColor(Color.gray.opacity(0.4))
                    )
                    .padding(.trailing)
            }
        }.padding(.init(top: 0, leading: 16, bottom: 16, trailing: 16))
        .onAppear {
            vmUser.loadImage(forKey: "imagePrilesKeySaved")
        }
    }
}

#Preview {
    NavigationTobBarView(nameView: "Home", SectionIcone: .HomeFitHub, ShoeImage: true)
}


enum iconeViewNavigation {
    case HomeFitHub
    case WorkOut
    case Food
    case Note
    case Community
}





struct OutlineModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    var cornerRadius: CGFloat = 20
    
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(
                    .linearGradient(
                        colors: [
                            .white.opacity(colorScheme == .dark ? 0.1 : 0.3),
                            .black.opacity(0.1)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                )
        )
    }
}

struct OutlineVerticalModifier: ViewModifier {
    var cornerRadius: CGFloat = 20
    
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(
                    .linearGradient(
                        colors: [.black.opacity(0.2), .white.opacity(0.6)],
                        startPoint: .top,
                        endPoint: .bottom)
                )
                .blendMode(.overlay)
        )
    }
}

struct SlideFadeIn: ViewModifier {
    var show: Bool
    var offset: Double
    
    func body(content: Content) -> some View {
        content
            .opacity(show ? 1 : 0)
            .offset(y: show ? 0 : offset)
    }
}

extension View {
    func slideFadeIn(show: Bool, offset: Double = 10) -> some View {
        self.modifier(SlideFadeIn(show: show, offset: offset))
    }
}

struct OutlineOverlay: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    var cornerRadius: CGFloat = 20
    
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(
                    .linearGradient(
                        colors: [
                            .white.opacity(colorScheme == .dark ? 0.6 : 0.3),
                            .black.opacity(colorScheme == .dark ? 0.3 : 0.1)
                        ],
                        startPoint: .top,
                        endPoint: .bottom)
                )
                .blendMode(.overlay)
        )
    }
}

struct BackgroundColor: ViewModifier {
    var opacity: Double = 0.6
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        content
            .overlay(
                Color("Background")
                    .opacity(colorScheme == .dark ? opacity : 0)
                    .blendMode(.overlay)
                    .allowsHitTesting(false)
            )
    }
}

extension View {
    func backgroundColor(opacity: Double = 0.6) -> some View {
        self.modifier(BackgroundColor(opacity: opacity))
    }
}

struct BackgroundStyle: ViewModifier {
    var cornerRadius: CGFloat = 20
    var opacity: Double = 0.6
    @AppStorage("isLiteMode") var isLiteMode = true
    
    func body(content: Content) -> some View {
        content
            .backgroundColor(opacity: opacity)
            .cornerRadius(cornerRadius)
            .shadow(color: Color("Shadow").opacity(isLiteMode ? 0 : 0.3), radius: 20, x: 0, y: 10)
            .modifier(OutlineOverlay(cornerRadius: cornerRadius))
    }
}

extension View {
    func backgroundStyle(cornerRadius: CGFloat = 20, opacity: Double = 0.6) -> some View {
        self.modifier(BackgroundStyle(cornerRadius: cornerRadius, opacity: opacity))
    }
}
