//
//  MovieTableViewCell.swift
//  tableViewlab5
//
//  Created by Ayaulym Ibrayeva on 4/12/20.
//  Copyright © 2020 Ayaulym Ibrayeva. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    var movie: Movie! {
           didSet {
               updateUI()
           }
       }
       
       // MARK: - Methods
       func updateUI() {
           self.titleLbl.text = movie.title
           self.yearLbl.text = movie.year
           
           ImageService.shared.downloadImage(url: movie.posterURL) { image in
               self.posterImageView.image = image
           }
       }
}
