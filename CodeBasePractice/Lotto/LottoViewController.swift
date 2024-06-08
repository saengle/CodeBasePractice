//
//  LottoViewController.swift
//  CodeBasePractice
//
//  Created by 쌩 on 6/5/24.
//

import UIKit



class LottoViewController: UIViewController {
    
    
    var myLotto: [LottoModel] = []
    let lottoView = LottoView()
    var list: [Int] = []
    var lastRounds: Int {
        //(2002, 12, 7) 1회 추첨일
        var days: Int
        var weeks = -1
        let startDate = DateComponents(timeZone: NSTimeZone(name: "KST") as TimeZone?, year: 2002, month: 12, day: 7, hour: 20, minute: 36)
        
        let calender = Calendar.autoupdatingCurrent
        // 일자 차이 가져오기
        if let selectedDate = calender.date(from: startDate) {
            days = calender.dateComponents([.day], from: selectedDate, to: Date.now).day ?? 0
            weeks = ((days + 1) / 7) + 1
                for i in 1...weeks {
                    list.append(i)
                }
            return weeks
        }
        // 만약 -1 이 return 되는것에 대한 처리 필요.
        return weeks
    }
    
    override func loadView() {
        view = lottoView
        lottoView.lottoPicker.delegate = self
        lottoView.lottoPicker.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLotto.append(contentsOf: LottoApiManager.fetchLotto(keyword: lastRounds))
//        configToolbar()
    }
}

extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    // pickerview 한개
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // pickerview의 선택지는 데이터의 개수만큼
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    // pickerview 내 선택지의 값들을 원하는 데이터로 채워준다.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return "\(list[row])회차"
    }
    // textfield의 텍스트에 pickerview에서 선택한 값을 넣어준다.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.lottoView.lottoTextField.text = "\(list[row])회차"
    }
    
    
    
}
