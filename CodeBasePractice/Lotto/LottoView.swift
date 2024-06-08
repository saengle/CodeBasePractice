//
//  LottoView.swift
//  CodeBasePractice
//
//  Created by 쌩 on 6/7/24.
//

import UIKit

import SnapKit

class LottoView: UIView {
    
    let screenWidth = UIScreen.main.bounds.size.width
    // 스크린 - 좌우스택뷰 여백 16 * 2  - 각 개체 사이 여백 4 * 7개 / 총개체수 8개.
    lazy var seperateLottoBallWidth = ( screenWidth - 32 - (4 * 7) ) / 8
    
    let lottoTextField: UITextField = {
        let tf = UITextField()
        tf.layer.borderWidth = 1
        tf.layer.borderColor = .init(gray: 0.5, alpha: 0.5)
        tf.textColor = .black
        return tf
    }()
    
    let commonLabel = UILabel()
    let dateLabel = UILabel()
    
    let roundLabel = UILabel()
    
    // -------스택뷰 세트------
    let lottoStackView = UIStackView()
    
    let lottoFirstLabel = UILabel()
    let lottoSecondLabel = UILabel()
    let lottoThirdLabel = UILabel()
    let lottoFourthLabel = UILabel()
    let lottoFifthLabel = UILabel()
    let lottoSixthLabel = UILabel()
    let lottoBonusLabel = UILabel()
    let lottoBonusDescriptionLabel = {
       let lb = UILabel()
        lb.text = "보너스"
        lb.textColor = .systemGray
        lb.font = .systemFont(ofSize: 12)
        lb.textAlignment = .center
        return lb
    }()
    lazy var plusLabel: UILabel = {
        let lb = UILabel()
        lb.text = "+"
        lb.font = .systemFont(ofSize: 17)
        lb.textAlignment = .center
        lb.layer.masksToBounds = true
        lb.layer.cornerRadius = self.seperateLottoBallWidth / 2
        return lb
    }()
    lazy var lottoCollection: [UILabel] = [self.lottoFirstLabel, self.lottoSecondLabel, self.lottoThirdLabel, self.lottoFourthLabel, self.lottoFifthLabel, self.lottoSixthLabel, self.lottoBonusLabel]
    // ------- 스택뷰 세트 종료 -------
    
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
        commonLabel.text = "당첨번호 안내"
        roundLabel.text = "999회 당첨결과"
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LottoView {
    private func configureHierachy() {
        
        [lottoTextField, commonLabel, dateLabel, roundLabel, lottoStackView, lottoBonusDescriptionLabel].forEach{self.addSubview($0)}
        //        addSubview(lottoTextField)
        
        [lottoFirstLabel, lottoSecondLabel, lottoThirdLabel, lottoFourthLabel, lottoFifthLabel, lottoSixthLabel, lottoBonusLabel, plusLabel].forEach{lottoStackView.addSubview($0)}
        
        lottoTextField.inputView = lottoPicker
        
        //
        //        for i in 0...lottoCollection.count - 1 {
        //            configureLottoLabels(number: i, label: lottoCollection[i])
        //        }
        for i in lottoCollection {
            i.backgroundColor = .cyan
            i.layer.cornerRadius = seperateLottoBallWidth / 2
            i.layer.masksToBounds = true
        }
        
    }
    
    
    private func configureLottoLabels(number: Int, label: UILabel) {
        label.text = "3"
        label.backgroundColor = .red
        label.layer.masksToBounds = true
        label.layer.cornerRadius = seperateLottoBallWidth / 2
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
            make.height.equalTo(20)
        }
        dateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(commonLabel.snp.centerY)
            make.trailing.equalTo(self.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(20)
        }
        
        roundLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(dateLabel.snp.bottomMargin).offset(32)
            make.height.equalTo(40)
        }
        lottoStackView.snp.makeConstraints { make in
            make.top.equalTo(roundLabel.snp.bottom).offset(20)
            make.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(50)
        }
        
        lottoFirstLabel.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(lottoStackView.snp.leading)
            make.width.height.equalTo(seperateLottoBallWidth)
        }
        lottoSecondLabel.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(lottoFirstLabel.snp.trailing).offset(4)
            make.width.height.equalTo(seperateLottoBallWidth)
        }
        lottoThirdLabel.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(lottoSecondLabel.snp.trailing).offset(4)
            make.width.height.equalTo(seperateLottoBallWidth)
        }
        lottoFourthLabel.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(lottoThirdLabel.snp.trailing).offset(4)
            make.width.height.equalTo(seperateLottoBallWidth)
        }
        lottoFifthLabel.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(lottoFourthLabel.snp.trailing).offset(4)
            make.width.height.equalTo(seperateLottoBallWidth)
        }
        lottoSixthLabel.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(lottoFifthLabel.snp.trailing).offset(4)
            make.width.height.equalTo(seperateLottoBallWidth)
        }
        plusLabel.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(lottoSixthLabel.snp.trailing).offset(4)
            make.width.height.equalTo(seperateLottoBallWidth)
        }
        lottoBonusLabel.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(plusLabel.snp.trailing).offset(4)
            make.trailing.equalTo(lottoStackView.snp.trailing)
            make.width.height.equalTo(seperateLottoBallWidth)
        }
        lottoBonusDescriptionLabel.snp.makeConstraints { make in
            make.centerX.equalTo(lottoBonusLabel)
            make.top.equalTo(lottoBonusLabel.snp.bottom).offset(4)
        }
    }
}
