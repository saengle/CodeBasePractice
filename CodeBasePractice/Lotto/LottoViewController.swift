//
//  LottoViewController.swift
//  CodeBasePractice
//
//  Created by 쌩 on 6/5/24.
//

import UIKit



class LottoViewController: UIViewController {
    
   let lottoView = LottoView()
    override func loadView() {
        view = lottoView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.view.backgroundColor = .white
    }
}

extension LottoViewController {

    
}
