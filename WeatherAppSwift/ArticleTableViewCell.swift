//
//  ArticleTableViewCell.swift
//  WeatherAppSwift
//
//  Created by GLB-312-PC on 21/08/17.
//  Copyright © 2017 GLB-312-PC. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var contentImageview: UIImageView!
    
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var desclable: UILabel!
   
    @IBOutlet weak var authorlable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
