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
    var movieList: [Movie] = []
    
    override func loadView() {
        view = movieView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchMovieRank(query: "20240608")
        movieView.tableView.delegate = self
        movieView.tableView.dataSource = self
        movieView.textField.delegate = self
        
        movieView.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        movieView.textField.addTarget(self, action: #selector(searchButtonTapped), for: .editingDidEnd)
        movieView.textField.addTarget(self, action: #selector(searchButtonTapped), for: .editingDidEndOnExit)
    }
}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell else { return UITableViewCell()}
        cell.rankBoxLabel.text = "\(indexPath.row)"
        cell.movieTitleLabel.text = movieList[indexPath.row].movieNm
        cell.movieOpenDateLabel.text = movieList[indexPath.row].openDt
        return cell
    }
    
}

extension MovieViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        keyboardDismiss()
    }
    
}
extension MovieViewController {
    @objc func searchButtonTapped() {
        guard let temp = movieView.textField.text else { return }
        searchMovieRank(query: temp)
        keyboardDismiss()
    }
    
    private func searchMovieRank(query: String) {
        movieApi.fetchDataAlamofire(query: query) { result in
            switch result {
            case .success(let movie):
                if let tempMovieList = movie.boxOfficeResult?.dailyBoxOfficeList {
                    self.movieList = tempMovieList
                    self.movieView.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    @objc func keyboardDismiss() {
        view.endEditing(true)
    }
}
