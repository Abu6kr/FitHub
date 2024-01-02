//
//  UserInfoViewModel.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 31.12.2023.
//

import Foundation
import SwiftUI

class UserInfoViewModel: ObservableObject {
    
    
    

    
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
    
}

extension NSNotification.Name {
    static let saveVenueProfileImage = Notification.Name("imagePrilesKeySaved")
}


enum SexSection {
    case Male
    case female
}
