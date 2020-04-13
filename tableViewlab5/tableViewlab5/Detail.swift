//
//  Detail.swift
//  tableViewlab5
//
//  Created by Ayaulym Ibrayeva on 4/13/20.
//  Copyright © 2020 Ayaulym Ibrayeva. All rights reserved.
//

import Foundation
struct Detail :Decodable{
    let Title: String
    let Year: String
    let Rated: String
    let Released: String
    let Runtime: String
    let Genre: String
    let Director: String
    let Writer: String
    let Actors: String
    let Plot: String
    let Language: String
    let Country: String
    let Awards: String
    let Poster: String
    let Ratings: [Ratings]
    let Metascore: String
    let imdbRating: String
    let imdbVotes: String
    let imdbID: String
    let `Type`: String
    let DVD: String
    let BoxOffice: String
    let Production: String
    let Website: String
    let Response: String
}

struct Ratings : Decodable {
    let Source: String
    let Value: String
}

