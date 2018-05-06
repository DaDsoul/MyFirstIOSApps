//
//  NewTablleViewController.swift
//  FilmsTop
//
//  Created by talgat on 23.06.17.
//  Copyright © 2017 Akezhan. All rights reserved.
//

import UIKit

class NewTablleViewController: UIViewController {
    
    @IBAction func backFunction(_ sender: UIButton) {
        performSegue(withIdentifier: "back", sender: NewTablleViewController())
    }
    
    @IBOutlet weak var imageFilm: UIImageView!
    var dish: Dish?

    @IBOutlet weak var filmImageView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let dish = dish else {
            return
        }
        
        filmImageView.text = dish.description
        imageFilm.image = dish.image
        
        
        
    }

}
