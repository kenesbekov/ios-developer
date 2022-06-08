//
//  Extensions.swift
//  TodoListApp
//
//  Created by Abdurahim on 08.06.2022.
//

import Foundation
import UIKit

extension UINavigationController {
    var previousViewController: UIViewController? {
       viewControllers.count > 1 ? viewControllers[viewControllers.count - 2] : nil
    }
}
