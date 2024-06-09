//
//  MovieViewController.swift
//  CodeBasePractice
//
//  Created by 쌩 on 6/9/24.
//

import UIKit

class MovieViewController: UIViewController {
    
    let movieView = MovieView()
    
    override func loadView() {
        view = movieView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
