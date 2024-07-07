//
//  ConnectionsWrapper.swift
//  StartupNews
//
//  Created by Admin on 07/07/2024.
//

import UIKit
import Alamofire

protocol ConnectionsWrapperDelegate {
    func getDataFromServer(data: [Article])
}

class ConnectionsWrapper: NSObject {
    
    var articlesArray = [Article]()
    
    // Propiedad del protocolo
    var delegate: ConnectionsWrapperDelegate?
    
    //MÉTODOS DE CONEXIÓN. GENERALMENTE MÉTODOS QUE TÚ CREAS QUE LUEGO LLAMAN A FUNCIONES DE ALAMOFIRE
    func getArticles() {
        
        AF.request(Constants.BASE_URL).responseDecodable(of: InshortAPIResponse.self) { response in
            
            switch response.result {
            case .success(let newsResponse):
                
                for article in newsResponse.data {
                    self.articlesArray.append(article)
                }
                
                self.delegate!.getDataFromServer(data: self.articlesArray)
                
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
        
    }
    
    //MARK: SINGLETON
    static let sharedInstance: ConnectionsWrapper = {
        let instance = ConnectionsWrapper()
        return instance
    }()
}
