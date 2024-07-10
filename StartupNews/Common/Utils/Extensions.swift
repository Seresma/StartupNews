//
//  Extensions.swift
//  StartupNews
//
//  Created by Sergio Escudero Manzano on 07/07/2024.
//

import UIKit

extension UILabel {
    func setWordWrapping() {
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
    }
}

extension UIActivityIndicatorView {
    func waitRandomTime() {
        let randomTime = Double.random(in: 0.5...1.5)
        DispatchQueue.main.asyncAfter(deadline: .now() + randomTime) {
            self.stopAnimating()
        }
    }
}



