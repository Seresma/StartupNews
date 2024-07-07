//
//  NSUserDefaultManager.swift
//  StartupNews
//
//  Created by Admin on 07/07/2024.
//

import UIKit

class NSUserDefaultManager{
    
    //MARK: - EXIST KEY
    func existKeyInUserDefaults(key: String) -> Bool{
        
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
    //MARK: - DELETE VALUES IN DEFAULTS
    func deleteValueInUserDefaultsWith(key: String){
        
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    func deleteAllValuesInUserDefaults(){
        
        if let bundle = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundle)
        }
    }
    
    //MARK: - SINGLETON
    static let sharedInstance: NSUserDefaultManager = {
        
        let instance = NSUserDefaultManager()
        return instance
    }()

}
