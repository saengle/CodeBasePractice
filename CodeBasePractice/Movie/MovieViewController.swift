//
//  MovieViewController.swift
//  CodeBasePractice
//
//  Created by 쌩 on 6/9/24.
//

import UIKit

class MovieViewController: UIViewController {
    
    let movieView = MovieView()
    let movieApi = MovieApiManager()
    
    override func loadView() {
        view = movieView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieApi.fetchDataAlamofire(query: "20240608") { result in
            switch result {
            case .success(let movie):
                print(movie)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        movieView.tableView.delegate = self
        movieView.tableView.dataSource = self
        
    }
}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell else { return UITableViewCell()}
        
        
        
        return cell
    }
    
}
