//
//  LottoView.swift
//  CodeBasePractice
//
//  Created by 쌩 on 6/7/24.
//

import UIKit

import SnapKit

class LottoView: UIView {
    
    let lottoTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .red
        tf.textColor = .black
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
        configureConstraints()
        self.backgroundColor = .white
        commonLabel.backgroundColor = .cyan
        dateLabel.backgroundColor = .brown
        roundLabel.backgroundColor = .gray
        lottoStackView.backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LottoView {
    private func configureHierachy() {
        
        [lottoTextField, commonLabel, dateLabel, roundLabel, lottoStackView].forEach{self.addSubview($0)}
//        addSubview(lottoTextField)
        
//        [lottofirstLabel, lottoSecondLabel, lottoThirdLabel, lottoFourthLabel, lottoFifthLabel, lottoSixthLabel, lottoBonusLabel, plusLabel].forEach{lottoStackView.addSubview($0)}
//        
//        for i in 0...lottoCollection.count - 1 {
//            configureLottoLabels(number: i, label: lottoCollection[i])
//        }
        
        
    }
    
    
    private func configureLottoLabels(number: Int, label: UILabel) {
        label.text = "3"
        label.backgroundColor = .red
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20
    }
    
    private func configureConstraints() {
        lottoTextField.snp.makeConstraints{ make in
            make.top.equalTo(self.safeAreaLayoutGuide).inset(16)
            make.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(44)
        }
        commonLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(16)
            make.top.equalTo(self.lottoTextField.snp.bottom).offset(16)
            make.width.height.equalTo(20)
        }
        dateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(commonLabel.snp.centerY)
            make.trailing.equalTo(self.safeAreaLayoutGuide).inset(16)
            make.width.height.equalTo(20)
        }
        
        roundLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(dateLabel.snp.bottomMargin).offset(32)
            make.width.height.equalTo(20)
        }
        lottoStackView.snp.makeConstraints { make in
            make.top.equalTo(roundLabel.snp.bottom).offset(20)
            make.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(100)
        }
        
    }
}
