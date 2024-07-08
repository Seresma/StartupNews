//
//  ConnectionsWrapper.swift
//  StartupNews
//
//  Created by Admin on 07/07/2024.
//

import UIKit
import Alamofire
import AlamofireImage

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
    
    // Closure con escape, se hace de forma síncrona
    func fetchImage(from url: String, completion: @escaping (UIImage?) -> Void) {
            
            guard let imageURL = URL(string: url) else {
                completion(nil)
                return
            }

            AF.request(imageURL).responseImage { response in
            
            if case .success(let image) = response.result {
                completion(image)
            } else {
                completion(nil)
            }
        }
    }
    
    //MARK: SINGLETON
    static let sharedInstance: ConnectionsWrapper = {
        let instance = ConnectionsWrapper()
        return instance
    }()
}
