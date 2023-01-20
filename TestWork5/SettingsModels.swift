//
//  SettingsModels.swift
//  TestWork5
//
//  Created by Ostap Artym on 20.01.2023.
//

import Foundation
import ImageIO
import UIKit

struct Section {
    let title: String
    let options: [SettingsOptionMain]
}

enum SettingsOptionMain {
    case accountCell(model: SettingsAccountOption)
    case generalCell(model: SettingsOption)
    case buttonCell(model: SettingsButtonOption)
}

struct SettingsAccountOption {
    let icon: UIImage?
    let fullName: String
    let emailAddress: String
    let iconBackgroundColor: UIColor?
    
    
}

struct SettingsButtonOption {
//    let button: UIButton
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor?
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor?
}
