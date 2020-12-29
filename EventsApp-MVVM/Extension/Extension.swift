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

//MARK: - UIView - anchor
extension UIView {
    
    enum Edge {
        case left
        case top
        case right
        case bottom
    }
    
    func pinToSuperviewEdges(_ edges: [Edge] = [.top, .left, .right, .bottom], constant: CGFloat = 0) {
        guard let superview = superview else { return }
        edges.forEach {
            switch $0 {
            case .top:
                topAnchor.constraint(equalTo: superview.topAnchor, constant: constant).isActive = true
            case .left:
                leftAnchor.constraint(equalTo: superview.leftAnchor, constant: constant).isActive = true
            case .right:
                rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -constant).isActive = true
            case .bottom:
                bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -constant).isActive = true
            }
        }
    }
}
