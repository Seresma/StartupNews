//
//  ConnectionsWrapper.swift
//  StartupNews
//
//  Created by Sergio Escudero Manzano on 07/07/2024.
//

import UIKit
import Alamofire
import AlamofireImage

protocol ConnectionsWrapperDelegate {
    func getDataFromServer(data: [Article])
}

class ConnectionsWrapper: NSObject {
    
    var articlesArray = [Article]()
    
    var delegate: ConnectionsWrapperDelegate?
    
    func getArticles(category: Categories) {
        
        AF.request("\(Constants.BASE_URL)\(Constants.Endpoints.category)\(category)").responseDecodable(of: InshortAPIResponse.self) { response in
            
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
    
    static let sharedInstance: ConnectionsWrapper = {
        let instance = ConnectionsWrapper()
        return instance
    }()
}
