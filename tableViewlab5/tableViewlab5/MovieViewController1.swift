//
//  MovieViewController1.swift
//  tableViewlab5
//
//  Created by Ayaulym Ibrayeva on 4/12/20.
//  Copyright © 2020 Ayaulym Ibrayeva. All rights reserved.
//

import UIKit

class MovieViewController1: UIViewController {

    @IBOutlet weak var TitleLbl: UILabel!
    
    @IBOutlet weak var poster2: UIImageView!
    
    
    @IBOutlet weak var directorlbl: UILabel!
    
    @IBOutlet weak var actorlbl: UILabel!
    
    
    @IBOutlet weak var awardlbl: UILabel!
    @IBOutlet weak var genrelbl: UILabel!
    var filmImdbId: String?

       override func viewDidLoad() {
              super.viewDidLoad()
             loadData()
              
          }
    func loadData(){
        MovieService.sharedinstance.searchByID(searchText: filmImdbId!) { (result) in
            self.updateUI(film: result)
        }
    }
    func updateUI(film: Detail){
               self.TitleLbl.text = film.Title
        self.directorlbl.text = film.Director
        self.actorlbl.text = film.Actors
        self .genrelbl.text = film.Genre
        self.awardlbl.text = film.Awards
               ImageService.shared.downloadImage(url: film.Poster) { image in
                   self.poster2.image = image
               }
           }

    }
