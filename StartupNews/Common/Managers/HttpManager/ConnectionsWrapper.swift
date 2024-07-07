//
//  ConnectionsWrapper.swift
//  StartupNews
//
//  Created by Admin on 07/07/2024.
//

import UIKit

class ConnectionsWrapper: NSObject {
    
    //MÉTODOS DE CONEXIÓN. GENERALMENTE MÉTODOS QUE TÚ CREAS QUE LUEGO LLAMAN A FUNCIONES DE ALAMOFIRE
    
    
    //MARK: SINGLETON
    static  let sharedInstance: ConnectionsWrapper = {
        let instance = ConnectionsWrapper()
        return instance
    }()
}
