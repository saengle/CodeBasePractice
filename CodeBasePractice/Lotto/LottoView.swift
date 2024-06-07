//
//  LottoView.swift
//  CodeBasePractice
//
//  Created by 쌩 on 6/7/24.
//

import UIKit

class LottoView: UIView {
    
    let lottoTextField: UITextField = {
        let tf = UITextField()
        return tf
    }()
    
    let commonLabel = UILabel()
    let dateLabel = UILabel()
    
    let roundLabel = UILabel()

    let lottoStackView: UIStackView = {
        let sv = UIStackView()
        
        return sv
    }()
    
    let lottofirstLabel = UILabel()
    let lottoSecondLabel = UILabel()
    let lottoThirdLabel = UILabel()
    let lottoFourthLabel = UILabel()
    let lottoFifthLabel = UILabel()
    let lottoSixthLabel = UILabel()
    let lottoBonusLabel = UILabel()
    
    lazy var lottoCollection: [UILabel] = [self.lottofirstLabel, self.lottoSecondLabel, self.lottoThirdLabel, self.lottoFourthLabel, self.lottoFifthLabel, self.lottoSixthLabel, self.lottoBonusLabel]
    
    let plusLabel: UILabel = {
        let lb = UILabel()
        lb.text = "+"
        lb.backgroundColor = .blue
        lb.layer.masksToBounds = true
        lb.layer.cornerRadius = 20
        return lb
    }()
    
    
    let lottoPicker: UIPickerView = {
        let pv = UIPickerView()
        
        return pv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierachy()
        
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LottoView {
    private func configureHierachy() {
        
        [].forEach{self.addSubview($0)}
        
        [lottofirstLabel, lottoSecondLabel, lottoThirdLabel, lottoFourthLabel, lottoFifthLabel, lottoSixthLabel, lottoBonusLabel, plusLabel].forEach{lottoStackView.addSubview($0)}
        
        for i in 0...lottoCollection.count - 1 {
            configureLottoLabels(number: i, label: lottoCollection[i])
        }
        
        
    }
    
    
    private func configureLottoLabels(number: Int, label: UILabel) {
        label.text = "3"
        label.backgroundColor = .red
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20
    }
    
    private func configureStraints() {
        
        
    }
}
