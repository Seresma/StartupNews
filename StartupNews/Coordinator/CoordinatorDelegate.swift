//
//  CoordinatorDelegate.swift
//  StartupNews
//
//  Created by Sergio Escudero Manzano on 08/07/2024.
//

import Foundation
import UIKit

protocol CoordinatorDelegate {
    static func instantiate() -> Self
}

extension CoordinatorDelegate where Self: UIViewController {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: Constants.Identifiers.mainView, bundle: nil)
        return storyboard.instantiateViewController(identifier: id) as! Self
    }
}
