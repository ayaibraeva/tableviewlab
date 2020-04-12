//
//  ViewController.swift
//  tableViewlab5
//
//  Created by Ayaulym Ibrayeva on 4/12/20.
//  Copyright © 2020 Ayaulym Ibrayeva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBF: UITextField!
    
 
    @IBAction func searchButton(_ sender: UIButton) {
        tableView.refreshControl = refreshControl
        downloadMovies()
    }
    
   
    
    
    var search = ""
    var searchResults:[String] = []
    var page = 0
    lazy var refreshControl: UIRefreshControl = {
            let view = UIRefreshControl()
            view.addTarget(self, action: #selector(downloadMovies), for: .valueChanged)
            return view
        }()
        
        // MARK: - Variables
        var movies: [Movie] = []
        
        // MARK: - Lifecyle
        override func viewDidLoad() {
            super.viewDidLoad()
            
            tableView.refreshControl = refreshControl
            downloadMovies()
        }
        
        // MARK: - Actions
        @objc func downloadMovies() {
            MovieService.sharedinstance.downloadMovies(searchText: searchBF.text!) { response in
                self.movies = response.movies
                self.tableView.refreshControl?.endRefreshing()
                self.tableView.reloadData()
            }
        }
   
    
    }

    extension ViewController: UITableViewDataSource, UITableViewDelegate {
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return movies.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "movie", for: indexPath) as! MovieTableViewCell
            cell.movie = self.movies[indexPath.row]
            
            
            return cell
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
               performSegue(withIdentifier: "showDetails", sender: self)
           }
           override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           
               if let destination = segue.destination as? MovieViewController1{
                destination.film = movies[(tableView.indexPathForSelectedRow?.row)!]
               }
           }
         // func scrollViewDidScroll(_ scrollView: UIScrollView) {
           //  if(tableView.contentOffset.y >= (tableView.contentSize.height - tableView.frame.size.height)) {
             //     page = page+1
               // downloadMovies(searchText: searchBF.text!, page: page)
              //}
          //}
  
          
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 132
        }
             
            }
        



