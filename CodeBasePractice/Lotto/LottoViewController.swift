//
//  LottoViewController.swift
//  CodeBasePractice
//
//  Created by 쌩 on 6/5/24.
//

import UIKit



class LottoViewController: UIViewController {
    
    let apiManager = LottoApiManager()
    var myLotto: [LottoModel] = []
    let lottoView = LottoView()
    override func loadView() {
        view = lottoView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLotto.append(contentsOf: LottoApiManager.fetchLotto(keyword: 1000))
    }
}

extension LottoViewController {
    
    
}
