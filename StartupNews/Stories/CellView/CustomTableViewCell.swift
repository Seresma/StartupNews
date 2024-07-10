//
//  CustomTableViewCell.swift
//  StartupNews
//
//  Created by Sergio Escudero Manzano on 07/07/2024.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        labelTitle.setWordWrapping()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
