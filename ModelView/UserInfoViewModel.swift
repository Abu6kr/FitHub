//
//  UserInfoViewModel.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 31.12.2023.
//

import Foundation
import SwiftUI

class UserInfoViewModel: ObservableObject {
    
    
    
    @Published var cruuentWeek: [Date] = []
    @Published var cruuentDay: Date = Date()
    
    @Published var wakeUpTime: Date = UserDefaults.standard.object(forKey: "wakeUpTime") as? Date ?? Date() {
            didSet {
                UserDefaults.standard.set(self.wakeUpTime, forKey: "wakeUpTime")
            }
        }
    @Published  var age: DateComponents = DateComponents()
    
    
    

    
    // MARK: User Info Save
    @AppStorage("NAMEUSER_KEY") var currentUserName: String = "name"
    @AppStorage("AGE_KEY") var currentUserAge: Int = 18
    @AppStorage("GENDER_KEY") var currentUserGender: String = "man"
    @AppStorage("HEIGHT_KEY") var currentUserHeight: Double = 160
    @AppStorage("WEIGHT_KEY") var currentUserWeight: Int = 60
    @AppStorage("NUMBER_KEY") var currentUserCaloresDay: Int = 1250

    
    @Published var imageProfiles: UIImage?
    @Published var savedimages: Bool = false
    
    

    
    
//    func saveUsrInfo(){
//        currentUserName = UserName
//        currentUserAge = Int(UserAge)
//        currentUserGender = gender
//        currentUserCaloresDay = caloresDay
//    }
    
    
//    @Published var nameUser: String = ""
//    
//    func retrieveText() {
//        if let savednameUser = UserDefaults.standard.string(forKey: "nameUserforKey")   {
//            nameUser = savednameUser
//        }
//    }
//    
//    func saveInfo() {
//        UserDefaults.standard.set(nameUser, forKey: "nameUserforKey")
//    }
//    
    
    
    func saveImage(imageName: String, image: UIImage,key: String) {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        
        let fileName = imageName
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        guard let data = image.jpegData(compressionQuality: 1) else { return }

        do {
            try data.write(to: fileURL)
            UserDefaults.standard.set(fileURL, forKey: key)
            savedimages = true
        } catch {
            print("Unable to write image data to disk", error)
        }
    }
    
    func loadImage(forKey: String) {
        guard let fileURL = UserDefaults.standard.url(forKey: forKey) else { return }
        do {
            let imageData = try Data(contentsOf: fileURL)
            if let uiImage = UIImage(data: imageData) {
                self.imageProfiles = uiImage
            } else {
                print("Unable to convert data to UIImage")
            }
        } catch {
            print("Unable to load image data from disk", error)
        }
    }
    
    func exteactCuetData() {
        let calendar = Calendar.current
        let weake = calendar.dateInterval(of: .weekOfMonth, for: Date())
        
        guard let firtDay = weake?.start else {
            return
        }
        (0..<7).forEach { day in
            if let weakeDay = calendar.date(byAdding: .day, value: day, to: firtDay){
                cruuentWeek.append(weakeDay)
            }
        }
    }
    
    func getDateFormat(date: Date) -> String {
        let formaterDate = DateFormatter()
        formaterDate.dateFormat = (isSameDay(date1: cruuentDay, date2: date) ? "dd" : "dd" )
        
        return (isDateToday(date: date) && isSameDay(date1: cruuentDay, date2: date) ? "" : "") + formaterDate.string(from: date)
        
    }
    func extracDate(date: Date) -> String {
        let formter  = DateFormatter()
        formter.dateFormat = (isSameDay(date1: cruuentDay, date2: date) ? "E dd" : "E dd" )
//        formter.dateFormat = (isSameDay(date1: cruuentDay, date2: date) ? "MMM " : "dd" )
        return (isDateToday(date: date) && isSameDay(date1: cruuentDay, date2: date) ? "" : "") + formter.string(from: date)
    }
    
    func isDateToday(date: Date) -> Bool {
        let calendar =  Calendar.current
        return calendar.isDateInToday(date)
    }
    
    func isSameDay(date1: Date,date2: Date) -> Bool {
        let calendar =  Calendar.current
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
}

extension NSNotification.Name {
    static let saveVenueProfileImage = Notification.Name("imagePrilesKeySaved")
}


enum SexSection {
    case Male
    case female
}







//MARK: uarl get user 
func getApiUer() async throws -> MoldeUer {
    
    let enduer = "URL:HHPPEES.WEEPSE"
    
    guard let url = URL(string: enduer) else {
        throw EGhEorr.inabideReoges
    }
    
    let (data, respnes) = try await URLSession.shared.data(from: url)
    
    guard let respnes = respnes as? HTTPURLResponse, respnes.statusCode == 200  else {
        throw EGhEorr.inabideReoges
    }
    
    do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(MoldeUer.self, from: data)
    } catch {
        throw EGhEorr.invideGalta
    }
    
    
}


struct MoldeUer: Codable {
    var name: String
    var id: String
}


enum EGhEorr: Error {
    case inbideUrl
    case inabideReoges
    case invideGalta
}
