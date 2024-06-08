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
        getLastRounds()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLotto.append(contentsOf: LottoApiManager.fetchLotto(keyword: 1000))
    }
}

extension LottoViewController {
    
    func getLastRounds() -> Int {
        //(2002, 12, 7) 1회 추첨일
        var days: Int
        var weeks = -1
        var startDate = DateComponents(timeZone: NSTimeZone(name: "KST") as TimeZone?, year: 2002, month: 12, day: 7, hour: 20, minute: 36)
        
        let today = Date.now
        let calender = Calendar.autoupdatingCurrent
        // 일자 차이 가져오기
        if let selectedDate = calender.date(from: startDate) {
            days = calender.dateComponents([.day], from: selectedDate, to: Date.now).day ?? 0
            weeks = ((days + 1) / 7) + 1
            return weeks
        }
        // 만약 -1 이 return 되는것에 대한 처리 필요.
        return weeks
    }
 
}
