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
    
    
    
    var film: Movie!
       override func viewDidLoad() {
              super.viewDidLoad()
              updateUI()
              
          }
            func updateUI(){
               self.TitleLbl.text = film.title
               
               ImageService.shared.downloadImage(url: film.posterURL) { image in
                   self.poster2.image = image
               }
           }

    }
