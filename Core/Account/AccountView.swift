//
//  AccountView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 31.12.2023.
//

import SwiftUI

struct AccountView: View {
    
    @ObservedObject var vmUser : UserInfoViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.themeView.background.ignoresSafeArea(.all)
                VStack {
                    VStack(alignment: .leading) {
                        
                        NavigationLink {
                            InfoUserImageNameView(vmUser: vmUser, onboardingState: .constant(0))
                        } label: {
                            HStack(alignment: .center,spacing: 10) {
                                ZStack {
                                    if let image = vmUser.imageProfiles {
                                        Image(uiImage: image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 60,height: 60)
                                            .background(Color.theme.Gray03)
                                            .clipShape(Circle())
                                    } else if vmUser.imageProfiles == nil {
                                        Image("")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 60,height: 60)
                                            .background(Color.theme.Gray03)
                                            .clipShape(Circle())
                                    }
                                }
                                
                                Text(vmUser.currentUserName ?? "")
                                    .font(.system(size: 18,weight: .regular))
                                    .foregroundStyle(Color.white)
                                Spacer()
                                Image(systemName: "chevron.right")
                            }.padding(.all,10)
                                .background(Color.theme.Gray06)
                                .clipShape(.rect(cornerRadius: 10))
                        }
                       
                    }.padding(.all)
                    
                    List {
                        NavigationLink {
                            
                        } label: {
                            Text("Health Details")
                        }
                        NavigationLink {
                            GoalUserView(vmUser: vmUser)
                        } label: {
                            Text("Change Goal Daly")
                        }
                        NavigationLink {
                            
                        } label: {
                            Text("Units of Measure")
                        }
                       
                      
                    }
                }
            }
            .navigationTitle("Account")
         
            .onAppear {
                vmUser.loadImage(forKey: "imagePrilesKeySaved")
            }
        }
    }
}


struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(vmUser: UserInfoViewModel())
            .preferredColorScheme(.dark)
    }
}



//import SwiftUI
//
//struct Home: View {
//    @ObservedObject var vmUser = UserInfoViewModel()
//    // MARK: - Properties
//    
//    var safeArea: EdgeInsets
//    var size: CGSize
//    var body: some View {
//        ScrollView(.vertical, showsIndicators: false) {
//            VStack{
//                // MARK: - Artwork
//                Artwork()
//                
//                // Since We ignored Top Edge
//                GeometryReader{ proxy in
//                    let minY = proxy.frame(in: .named("SCROLL")).minY - safeArea.top
//
//                }
//                .frame(height: 50)
//                .padding(.top, -34)
//                .zIndex(1)
//                
//                VStack{
//
//                    // MARK: - Album View
//                    AlbumView()
//                }
//                .padding(.top, 10)
//                .zIndex(0)
//                
//            }
//            .overlay(alignment: .top) {
//                HeaderView()
//            }
//            
//        }
//        .coordinateSpace(name: "SCROLL")
//    }
//    
//    @ViewBuilder
//    func Artwork() -> some View {
//        let height = size.height * 0.45
//        GeometryReader{ proxy in
//            
//            let size = proxy.size
//            let minY = proxy.frame(in: .named("SCROLL")).minY
//            let progress = minY / (height * (minY > 0 ? 0.5 : 0.8))
//            
//            Image("Logo")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: size.width, height: size.height + (minY > 0 ? minY : 0 ))
//                .clipped()
//                .overlay(content: {
//                    ZStack(alignment: .bottom) {
//                        
//                        // MARK: - Gradient Overlay
//                        Rectangle()
//                            .fill(
//                                .linearGradient(colors: [
//                                    .black.opacity(0 - progress),
//                                    .black.opacity(0.1 - progress),
//                                    .black.opacity(0.3 - progress),
//                                    .black.opacity(0.5 - progress),
//                                    .black.opacity(0.8 - progress),
//                                    .black.opacity(1),
//                                ], startPoint: .top, endPoint: .bottom)
//                            )
//                        VStack(spacing: 0) {
//                            Text("Fally\nIpupa")
//                                .font(.system(size: 45))
//                                .fontWeight(.bold)
//                                .multilineTextAlignment(.center)
//                            
//                            Text("710,329 monthly listeners".uppercased())
//                                .font(.caption)
//                                .fontWeight(.bold)
//                                .foregroundColor(.gray)
//                                .padding(.top, 15)
//                        }
//                        .opacity(1 + (progress > 0 ? -progress : progress))
//                        .padding(.bottom, 55)
//                        
//                        // Moving with Scroll View
//                        
//                        .offset(y: minY < 0 ? minY : 0 )
//                    }
//                })
//                .offset(y: -minY)
//            
//        }
//        .frame(height: height + safeArea.top )
//    }
//    
//    @ViewBuilder
//    func AlbumView() -> some View {
//        VStack(spacing:  25) {
//            VStack {
//                VStack(alignment: .leading) {
//                    
//                    NavigationLink {
//                        
//                    } label: {
//                        HStack(alignment: .center,spacing: 10) {
//                            ZStack {
//                                if let image = vmUser.imageProfiles {
//                                    Image(uiImage: image)
//                                        .resizable()
//                                        .scaledToFill()
//                                        .frame(width: 60,height: 60)
//                                        .background(Color.theme.Gray03)
//                                        .clipShape(Circle())
//                                } else if vmUser.imageProfiles == nil {
//                                    Image("")
//                                        .resizable()
//                                        .scaledToFill()
//                                        .frame(width: 60,height: 60)
//                                        .background(Color.theme.Gray03)
//                                        .clipShape(Circle())
//                                }
//                            }
//                            
//                            Text(vmUser.UserName)
//                                .font(.system(size: 18,weight: .regular))
//                                .foregroundStyle(Color.themeView.secondaryText)
//                            Spacer()
//                            Image(systemName: "chevron.right")
//                        }.padding(.all,10)
//                            .background(Color.theme.Gray06)
//                            .clipShape(.rect(cornerRadius: 10))
//                    }
//                   
//                }.padding(.all)
//                
//                VStack(spacing: 10) {
//                    NavigationLink {
//                        
//                    } label: {
//                        HStack(alignment: .center,spacing: 10) {
//                            Text("Health Details")
//                            Spacer()
//                            Image(systemName: "chevron.right")
//                        }.padding(.all,10)
//                            .background(Color.theme.Gray06)
//                            .clipShape(.rect(cornerRadius: 10))
//                        
//                    }
//                    Divider()
//                    NavigationLink {
//                        
//                    } label: {
//                        HStack(alignment: .center,spacing: 10) {
//                            Text("Change Move Goal")
//                            Spacer()
//                            Image(systemName: "chevron.right")
//                        }.padding(.all,10)
//                            .background(Color.theme.Gray06)
//                            .clipShape(.rect(cornerRadius: 10))
//                    
//                    }
//                    Divider()
//                    NavigationLink {
//                        
//                    } label: {
//                        HStack(alignment: .center,spacing: 10) {
//                            Text("Units of Measure")
//                            Spacer()
//                            Image(systemName: "chevron.right")
//                        }.padding(.all,10)
//                            .background(Color.theme.Gray06)
//                            .clipShape(.rect(cornerRadius: 10))
//                     
//                    }
//                    
//                }.padding(.all,5)
//                    .background(Color.theme.Gray06)
//                    .clipShape(.rect(cornerRadius: 10))
//                    .padding(.horizontal)
//            }.foregroundStyle(Color.white)
//        }
//        .padding(15)
//    }
//    
//    // MARK: - Header View
//    @ViewBuilder
//    func HeaderView() -> some View {
//        GeometryReader{ proxy in
//            let minY = proxy.frame(in: .named("SCROLL")).minY
//            let height = size.height * 0.45
//            let progress = minY / (height * (minY > 0 ? 0.5 : 0.8))
//            let titleProgress =  minY / height
//            
//            HStack(spacing: 15) {
//                Button {
//                    
//                } label: {
//                    Image(systemName: "chevron.left")
//                        .font(.title3)
//                        .foregroundColor(.white)
//                }
//                Spacer(minLength: 0)
//
//            }
//            .overlay(content: {
//                Text("Fally Ipupa")
//                    .fontWeight(.semibold)
//                    .offset(y: -titleProgress > 0.75 ? 0 : 45)
//                    .clipped()
//                    .animation(.easeOut(duration: 0.25), value: -titleProgress > 0.75)
//            })
//            .padding(.top, safeArea.top + 10)
//            .padding([.horizontal,.bottom], 15)
//            .background(
//                Color.black
//                    .opacity(-progress > 1 ? 1 : 0)
//            )
//            .offset(y: -minY)
//        }
//        .frame(height: 35)
//    }
//}
//
//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentBar()
//    }
//}
//
//import SwiftUI
//
//struct ContentBar: View {
//    var body: some View {
//        GeometryReader {
//            let safeArea = $0.safeAreaInsets
//            let size = $0.size
//            Home(safeArea: safeArea, size: size)
//                .ignoresSafeArea(.container, edges: .top)
//        }
//        .preferredColorScheme(.dark )
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentBar()
//    }
//}
//
