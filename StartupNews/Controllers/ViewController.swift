//
//  ViewController.swift
//  StartupNews
//
//  Created by Admin on 07/07/2024.
//

import UIKit

class ViewController: UIViewController, ConnectionsWrapperDelegate {

    var data = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ConnectionsWrapper.sharedInstance.delegate = self
        ConnectionsWrapper.sharedInstance.getArticles()
    }

    func getDataFromServer(data: [Article]) {
        self.data = data
        DispatchQueue.main.async {
            print(self.data)
            //self.table.reloadData()
        }
    }
}

