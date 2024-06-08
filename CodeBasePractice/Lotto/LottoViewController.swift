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
        configToolbar()
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
    
    func configToolbar() {
        // toolbar를 만들어준다.
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.white
        toolBar.sizeToFit()
        
        // 만들어줄 버튼
        // flexibleSpace는 취소~완료 간의 거리를 만들어준다.
        let doneBT = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(self.donePicker))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelBT = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(self.cancelPicker))
        
        // 만든 아이템들을 세팅해주고
        toolBar.setItems([cancelBT,flexibleSpace,doneBT], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        // 악세사리로 추가한다.
        self.lottoView.lottoTextField.inputAccessoryView = toolBar
    }

    // "완료" 클릭 시 데이터를 textfield에 입력 후 입력창 내리기
    @objc func donePicker() {
        let row = self.lottoView.lottoPicker.selectedRow(inComponent: 0)
        self.lottoView.lottoPicker.selectRow(row, inComponent: 0, animated: false)
        self.lottoView.lottoTextField.text = "\(row)회차"
        self.lottoView.lottoTextField.resignFirstResponder()
    }

    // "취소" 클릭 시 textfield의 텍스트 값을 nil로 처리 후 입력창 내리기
    @objc func cancelPicker() {
        self.lottoView.lottoTextField.text = nil
        self.lottoView.lottoTextField.resignFirstResponder()
    }
    
}
