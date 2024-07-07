//
//  Constants.swift
//  StartupNews
//
//  Created by Admin on 07/07/2024.
//

import UIKit

struct Constants {
    
    static let APP_NAME = "StartupNews"
    static let BASE_URL = "https://inshortsapi.vercel.app/news?category=startup"
    static let API_KEY = "API KEY"
    
    //MARK: -  IDENTIFIERS
    struct Identifiers {
        static let homeView = "homeView"
        static let loginView = "loginView"
        static let rememberView = "rememberView"
        
    }
    
    //MARK: -  COLORS
    struct Colors {
        static let toastColor = UIColor(named: "#485864")
        static let colorDisableButton = UIColor(named: "#ebebeb")
        static let yellowColor = UIColor(named: "#eac117")
    }
    
    //MARK: -  ENVIRONMENT
    struct Environments {
        static let TRAINING = "http://la URL que sea"
        static let PRODUCTION = "http://la URL que sea"
    }

}
