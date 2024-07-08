//
//  CoordinatorDelegate.swift
//  StartupNews
//
//  Created by Admin on 08/07/2024.
//

import Foundation
import UIKit

protocol CoordinatorDelegate {
    static func instantiate() -> Self
}

// Esto devuelve el storyboard que está dentro de Main correspondiente
extension CoordinatorDelegate where Self: UIViewController {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: id) as! Self
    }
}
