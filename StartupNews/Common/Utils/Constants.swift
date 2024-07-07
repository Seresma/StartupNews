//
//  Constants.swift
//  StartupNews
//
//  Created by Admin on 07/07/2024.
//

import UIKit

struct Constants {
    
    static let APP_NAME = "Nombre de la App"
    
    //MARK: -  IDENTIFIERS
    struct Identifiers {
        static let homeView = "homeView"
        static let loginView = "loginView"
        static let rememberView = "rememberView"
        
    }
    
    //MARK: -  COLORS
    struct Color {
        static let toastColor = UIColor(named: "#485864")
        static let colorDisableButton = UIColor(named: "#ebebeb")
        static let yellowColor = UIColor(named: "#eac117")
    }
    
    //MARK: -  ENVIRONMENT
    struct Environment {
        static let TRAINING = "http://la URL que sea"
        static let PRODUCTION = "http://la URL que sea"
    }

}
