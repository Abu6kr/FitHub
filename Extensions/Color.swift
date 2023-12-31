//
//  Color.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 28.12.2023.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = ColorTheme()
    static let themeView = ColorTheme2()
   
    
}

struct ColorTheme {
    
    let Blue = Color("ColorBlue")
    let Gray = Color("ColorGray")
    let Gray02 = Color("ColorGray02")
    let Gray03 = Color("ColorGray03")
    let Gray04 = Color("ColorGray04")
    let Gray05 = Color("ColorGray05")
    let Gray06 = Color("ColorGray06")
    let Green = Color("ColorGreen")
    let Indigo = Color("ColorIndigo")
    let Orange = Color("ColorOrange")
    let Pink = Color("ColorPink")
    let Purple = Color("Purple")
    let Red = Color("ColorRed")
    let Yellow = Color("Yellow")
    let Colorblack = Color("Colorblack")
    
    let moveRingWeekdayBackground = Color(red: 53 / 255, green: 17 / 255, blue: 22 / 255)
    let moveRingBackground = Color(red: 33 / 255, green: 2 / 255, blue: 3 / 255)
    let moveRingStartColor = Color(red: 210 / 255, green: 19 / 255, blue: 49 / 255)
    let moveRingEndColor = Color(red: 255 / 255, green: 50 / 255, blue: 135 / 255)
    
    let exerciseRingWeekdayBackground = Color(red: 31 / 255, green: 50 / 255, blue: 19 / 255)
    let exerciseRingBackground = Color(red: 6 / 255, green: 34 / 255, blue: 1 / 255)
    let exerciseRingStartColor = Color(red: 63 / 255, green: 212 / 255, blue: 0 / 255)
    let exerciseRingEndColor = Color(red: 184 / 255, green: 255 / 255, blue: 0 / 255)
    
    let standRingWeekdayBackground = Color(red: 22 / 255, green: 44 / 255, blue: 54 / 255)
    let standRingBackground = Color(red: 1 / 255, green: 29 / 255, blue: 34 / 255)
    let standRingStartColor = Color(red: 0 / 255, green: 186 / 255, blue: 225 / 255)
    let standRingEndColor = Color(red: 0 / 255, green: 254 / 255, blue: 207 / 255)
    
}

struct ColorTheme2 {
    let Coloraccent =  Color("Coloraccent")
    let background = Color("Colorbackground")
    let secondaryText = Color("ColorsecondaryText")
    let activityValueText = Color(red: 170 / 255, green: 180 / 255, blue: 190 / 255)
}

