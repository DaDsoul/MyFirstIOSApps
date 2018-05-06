//
//  ViewController2.swift
//  FilmsTop
//
//  Created by talgat on 22.06.17.
//  Copyright © 2017 Akezhan. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    var nilValue = [Dish]()
    var filter = ""
    var filteredList: [Dish] {
            if filter.characters.count == 0 {
                return dishImage1
            }
        let filtered = self.dishImage1.filter {
            ($0.description?.lowercased().contains(self.filter.lowercased()))!
            }
            return filtered
        }
    
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

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchControl.delegate = self
        self.tableView.tableHeaderView = searchControl.searchBar
        searchControl.searchBar.delegate = self as? UISearchBarDelegate
        searchControl.searchResultsUpdater = self as? UISearchResultsUpdating
        searchControl.dimsBackgroundDuringPresentation = false
        searchControl.hidesNavigationBarDuringPresentation = false
    }
     let searchControl = UISearchController(searchResultsController: nil)
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "testsas" {
            let vc = segue.destination as! NewTablleViewController
            vc.dish = sender as? Dish 
        }
    }
    
}

extension ViewController2: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let film = filteredList[indexPath.row]
        performSegue(withIdentifier: "testsas", sender: film)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return self.filteredList.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId") as! TableViewCell
        cell.imageFilm.image = filteredList[indexPath.row].image
        cell.nameFilm.text = filteredList[indexPath.row].description
        return cell
    }
    
   
}

extension ViewController2: UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        self.filter = searchController.searchBar.text!
        self.tableView.reloadData()
    }
//    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//        self.tableView.reloadData()
//    }
}

