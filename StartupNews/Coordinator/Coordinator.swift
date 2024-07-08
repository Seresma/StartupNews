//
//  Coordinator.swift
//  StartupNews
//
//  Created by Admin on 08/07/2024.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
