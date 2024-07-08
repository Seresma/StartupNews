//
//  CustomTableViewCell.swift
//  StartupNews
//
//  Created by Admin on 07/07/2024.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        // Para que se haga wrapping en 1 linea
        labelTitle.setWordWrapping()
        
        // Extensión para hacer rectangulo con bordes redondeados
        articleImageView.roundCorners(radius: 10)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
