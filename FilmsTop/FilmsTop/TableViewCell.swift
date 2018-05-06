//
//  TableViewCell.swift
//  FilmsTop
//
//  Created by talgat on 23.06.17.
//  Copyright © 2017 Akezhan. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameFilm: UILabel!
    @IBOutlet weak var imageFilm: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
