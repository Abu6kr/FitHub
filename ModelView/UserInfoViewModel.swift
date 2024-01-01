//
//  UserInfoViewModel.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 31.12.2023.
//

import Foundation
import SwiftUI

class UserInfoViewModel: ObservableObject {
    
    
    
    // MARK: User Info
    @Published var UserName: String = ""
    @Published var UserAge: Int = 18
    @Published var gender: String = ""
    @Published var caloresDay: Int = 1250
    
    // MARK: User Info Save
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("CaloresDay") var currentUserCaloresDay: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("Height") var currentUserHeight: Double?
    @AppStorage("Weight") var currentUserWeight: Int?
    
    
    @Published var imageProfiles: UIImage?
    @Published var savedimages: Bool = false
    
    
    
    
    
    func saveUsrInfo(){
        currentUserName = UserName
        currentUserAge = Int(UserAge)
        currentUserGender = gender
        currentUserCaloresDay = caloresDay
    }
    
    
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
