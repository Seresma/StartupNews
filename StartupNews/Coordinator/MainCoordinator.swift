//
//  MainCoordinator.swift
//  StartupNews
//
//  Created by Admin on 08/07/2024.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goDetailViewController(data: Article) {
        let detailView = DetailViewController.instantiate()
        detailView.selectedArticle = data
        navigationController.pushViewController(detailView, animated: true)
    }
    
}
