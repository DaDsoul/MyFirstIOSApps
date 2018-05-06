//
//  ViewController.swift
//  FilmsTop
//
//  Created by talgat on 22.06.17.
//  Copyright © 2017 Akezhan. All rights reserved.
//

import UIKit

class Dish {
    var image = UIImage()
    var description: String?
    init() {}
    
    init (image: UIImage, description: String){
        self.image = image
        self.description = description
    }
}

class ViewController: UIViewController {
    var dishImage1:[Dish]=[
        Dish(image: #imageLiteral(resourceName: "Jaws"), description : "Jaws"),
        Dish(image: #imageLiteral(resourceName: "Star Wars"), description : "Star Wars"),
        Dish(image: #imageLiteral(resourceName: "MoonLight"), description : "MoonNight"),
        Dish(image: #imageLiteral(resourceName: "HarryPotter"), description : "Harry Potter"),
        Dish(image: #imageLiteral(resourceName: "SkyFall"), description : "Sky Fall"),
        Dish(image: #imageLiteral(resourceName: "JurassicPark"), description : "JurassicPark"),
        Dish(image: #imageLiteral(resourceName: "e208d1d708742415098542ab672feeb7"), description : "Thor"),
        Dish(image: #imageLiteral(resourceName: "dredd-movie-poster"), description : "Judge Dredd"),
        Dish(image: #imageLiteral(resourceName: "392c8c7bcd701cc0299784d311209f1b"), description : "Star Track"),
        Dish(image: #imageLiteral(resourceName: "the-magnificent-seven-movie-poster-2016-1020776374"), description : "Magnificient Seven"),
        Dish(image: #imageLiteral(resourceName: "8"), description : "Perfume"),
        Dish(image: #imageLiteral(resourceName: "154950042"), description : "Terminator"),
        Dish(image: #imageLiteral(resourceName: "____the_avengers_______movie_poster_by_andrewss7-d4un6qw"), description : "Avengers"),
        Dish(image: #imageLiteral(resourceName: "canva-dramatic-black-and-white-film-poster-MACGkF3LOPw"), description : "Things Left Unspoken"),
        Dish(image: #imageLiteral(resourceName: "jungle_book_ver6_xlg"), description : "Jungle Book")
    ]

    @IBOutlet weak var layout2: UICollectionViewFlowLayout!
    
    @IBOutlet weak var layout1: UICollectionViewFlowLayout!

    @IBOutlet weak var collectionView2: UICollectionView!
    
    @IBOutlet weak var collectionView1: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.layout1.minimumLineSpacing = 1
        self.layout1.minimumInteritemSpacing = 1
        let size = (self.view.frame.width - 2) / 3
        self.layout1.itemSize = CGSize(width: size, height: size)
        self.layout2.minimumLineSpacing = 0
        self.layout2.minimumInteritemSpacing = 0
        let size2 = self.view.frame.width
        self.layout2.itemSize = CGSize(width: size2, height: size2/2.4)
        
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionView1 {
            let cell = collectionView1.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! ImageCollectionViewCell
            cell.imageFilm2.image = dishImage1[indexPath.row].image
            return cell
        }
        else  {
            let cell = collectionView2.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! ImageCollectionViewCell
            cell.imageFilm.image = dishImage1[indexPath.row].image
            return cell
        }
    }
}
extension ViewController2: UICollectionViewDelegate{
func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
    
    if kind == UICollectionElementKindSectionHeader {
           let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footer", for: indexPath) as! FooterCollectionReusableView
        headerView.textFooter.text = "Hello"
        return headerView
        }
    return UICollectionReusableView()
    }
}
