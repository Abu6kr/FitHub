//
//  NtivationsView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 21.01.2024.
//

import SwiftUI

struct NtivationsView: View {
    
    @State var selectedDate = Date()
    
    let notify = NotificationHandler()
    
    @State private var isDisplayed = false
    
    @State var list = UserDefaults.standard.array(forKey: "nestedList") as? [[String]] ?? [[String]]()

    @State private var contacts: [String] = [
        "12:00",
        "15:00"
    ]
    
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            VStack {
                VStack {
                    
                    VStack(alignment: .leading){
                        Text("""
                         напомнить словами
                         Эй, а ты потренил?
                         """)
                        .font(.system(size: 30,weight: .regular))
                        .foregroundStyle(Color.white)
                        
                        Rectangle()
                            .foregroundStyle(Color.green)
                            .frame(height: 4)
                    }.padding(.horizontal,27)
                        .padding(.bottom,20)
                    
                    VStack {
                        
                        if contacts.isEmpty {
                            ScrollView {
                                VStack {
                                    HStack(spacing: 20) {
                                        Image(systemName: "bell.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30, height: 30)
                                            .frame(width: 50,height: 50)
                                            .background(
                                                RoundedRectangle(cornerRadius: .infinity)
                                                    .stroke(lineWidth: 1)
                                                    .foregroundStyle(Color.gray)
                                            )
                                            .clipShape(Circle())
                                        Text("ВЫбрать время")
                                            .font(.system(size: 22,weight: .regular))
                                        Spacer()
                                    }.foregroundStyle(Color.white)
                                        .padding(.leading,27)
                                    Divider()
                                        .overlay(Color.white)
                                        .foregroundStyle(Color.white)
                                    HStack(spacing: 20) {
                                        Button(action: {
                                            withAnimation(.easeInOut) {
                                                self.contacts.append(String("20:10"))
                                            }
                                        }, label: {
                                            Image(systemName: "plus")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 30, height: 30)
                                                .frame(width: 50,height: 50)
                                                .background(
                                                    RoundedRectangle(cornerRadius: .infinity)
                                                        .stroke(lineWidth: 1)
                                                        .foregroundStyle(Color.gray)
                                                )
                                                .clipShape(Circle())
                                        })
                                        
                                        Text("добавить время")
                                            .font(.system(size: 22,weight: .regular))
                                        Spacer()
                                    }.foregroundStyle(Color.white)
                                        .listRowBackground(Color.black)
                                        .padding(.horizontal,27)
                                        .padding(.top,10)

                                }
                            }
                        } else {
                            List {
                                ForEach(contacts,id: \.self) { item in
                                    NavigationTimerComtines()
                                        .listRowBackground(Color.black)
                                }.onDelete(perform: { indexSet in
                                    contacts.remove(atOffsets: indexSet)
                                })
                                .listRowSeparatorTint(.clear)
                                    HStack(spacing: 20) {
                                        Button(action: {
                                            self.contacts.append(String("20:10"))
                                        }, label: {
                                            Image(systemName: "plus")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 30, height: 30)
                                                .frame(width: 50,height: 50)
                                                .background(
                                                    RoundedRectangle(cornerRadius: .infinity)
                                                        .stroke(lineWidth: 1)
                                                        .foregroundStyle(Color.gray)
                                                )
                                                .clipShape(Circle())
                                        })
                                        
                                        Text("добавить время")
                                            .font(.system(size: 22,weight: .regular))
                                        Spacer()
                                    }.foregroundStyle(Color.white)
                                        .listRowBackground(Color.black)
                                        .padding(.all,10)
                                
                            }.listStyle(.plain)
                            
                            if contacts.count >= 6 {
                                HStack(spacing: 20) {
                                    Button(action: {
                                        self.contacts.append(String("20:10"))
                                    }, label: {
                                        Image(systemName: "plus")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30, height: 30)
                                            .frame(width: 50,height: 50)
                                            .background(
                                                RoundedRectangle(cornerRadius: .infinity)
                                                    .stroke(lineWidth: 1)
                                                    .foregroundStyle(Color.gray)
                                            )
                                            .clipShape(Circle())
                                    })
                                    
                                    Text("добавить время")
                                        .font(.system(size: 22,weight: .regular))
                                    Spacer()
                                }.foregroundStyle(Color.white)
                                    .listRowBackground(Color.black)
                                    .padding(.all,10)
                                    .padding(.horizontal,27)

                            }
                            
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NtivationsView()
}



struct NavigationTimerComtines: View {
    @State var selectedDate = Date()
    
    let notify = NotificationHandler()
    
    @State private var isDisplayed = false
    private let dateFormatter: DateFormatter = {
           let formatter = DateFormatter()
        formatter.timeStyle = .short
           return formatter
       }()
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Image(systemName: "bell.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .frame(width: 50,height: 50)
                ZStack {
                    Text("\(selectedDate, formatter: dateFormatter)")
                        .font(.system(size: 22,weight: .semibold))

                    Spacer()
                    DatePicker(selection: $selectedDate, displayedComponents: .hourAndMinute) {
                        Text("")
                            .foregroundStyle(Color.white)
                    }.frame(width: 0)
                        .opacity(0.1)
                }
       
                Toggle("", isOn: $isDisplayed)
                    .onChange(of: isDisplayed) { value in
                        if isDisplayed == true {
                            notify.sendNotification(
                                date:selectedDate,
                                type: "date",
                                title: "Выполнение привычек",
                                body: "Привет-привет Не забудь выполнить!")
                        }
                        print(value)
                }
            }.foregroundStyle(Color.white)
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(Color.white)
        }
    }
}



import UserNotifications

class NotificationHandler {
    func askPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("Access granted!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func sendNotification(date: Date, type: String, timeInterval: Double = 10, title: String, body: String) {
        var trigger: UNNotificationTrigger?
        
        // Create a trigger (either from date or time based)
        if type == "date" {
            let dateComponents = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute], from: date)
            trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        } else if type == "time" {
            trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        }
        
        // Customise the content
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        // Create the request
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }

}
