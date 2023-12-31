//
//  UINavigationControllerEactenions.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 29.12.2023.
//

import Foundation
import SwiftUI

extension UINavigationController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}
