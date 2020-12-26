//
//  Extension.swift
//  EventsApp-MVVM
//
//  Created by Justyna Kowalkowska on 23/12/2020.
//

import UIKit

//MARK: - UIColor Extension
extension UIColor {
    static let primary = UIColor(red: 0/255, green: 39/255, blue: 255/255, alpha: 0.6)
}

//MARK: - UIViewController Extension
extension UIViewController {
    
    static func instantiate<T>() -> T {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(identifier: "\(T.self)") as! T
        return controller
    }
}
