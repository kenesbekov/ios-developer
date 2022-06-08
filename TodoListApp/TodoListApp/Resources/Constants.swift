//
//  Constants.swift
//  TodoListApp
//
//  Created by Abdurahim on 08.06.2022.
//

import Foundation
import UIKit

struct AppImageConfigs {
    static let customConfig = UIImage.SymbolConfiguration(pointSize: 25, weight: .medium, scale: .medium)
}

struct AppColors {
    static let navigationTitleColor = [NSAttributedString.Key.foregroundColor:UIColor.black]
}

struct AppImages {
    static let plusCircle = UIImage(systemName: "plus.circle", withConfiguration: AppImageConfigs.customConfig)
    static let notFavoriteImage = UIImage(systemName: "star", withConfiguration: AppImageConfigs.customConfig)
    static let favoriteImage = UIImage(systemName: "star.fill", withConfiguration: AppImageConfigs.customConfig)
}

struct ScreenSize {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
}
