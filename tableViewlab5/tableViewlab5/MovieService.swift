//
//  MovieService.swift
//  tableViewlab5
//
//  Created by Ayaulym Ibrayeva on 4/12/20.
//  Copyright © 2020 Ayaulym Ibrayeva. All rights reserved.
//

import Foundation
class MovieService {

    static let sharedinstance = MovieService()
    
    func downloadMovies(searchText: String, completion: @escaping (DownloadFilmsResponse) -> Void) {
        guard let url = URL(string:  "https://www.omdbapi.com/?apikey=7ace6494&s=\(searchText)&r=json") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print(error)
                }
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(DownloadFilmsResponse.self, from: data)
                
                DispatchQueue.main.async {
                    completion(response)
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    func searchByID(searchText: String, completion: @escaping (Detail) -> Void) {
        guard let url = URL(string:  "https://www.omdbapi.com/?apikey=7ace6494&i=\(searchText)&r=json") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print(error)
                }
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(Detail.self, from: data)
                
                DispatchQueue.main.async {
                    completion(response)
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
  
    class DownloadFilmsResponse: Codable {
        var movies: [Movie]
        var totalResults: String
        
        enum CodingKeys: String, CodingKey {
            case movies = "Search"
            case totalResults
        }
    }


 //   func searchByImdbID(search: String, onCompletion: @escaping (Film) -> Void) {
   //     let resquest = URLRequest(url: URL(string: "\(baseURL)?apikey=\(apiKey)&i=\(search)")!)
     //   let session = URLSession(configuration: URLSessionConfiguration.default)
        
       // let task = session.dataTask(with: resquest, completionHandler: {(data, response, error) in
   //         if let error = error {
             //   print(error.localizedDescription)
    //        } else if let dataResponse = data {
       //         guard let film = try? JSONDecoder().decode(Film.self, from: dataResponse) else {
        //            print("Error : Couldn't decode data")
      //              return
      //          }
   //             onCompletion(film)
  //          }
//        })
//        task.resume()
//    }
//}
