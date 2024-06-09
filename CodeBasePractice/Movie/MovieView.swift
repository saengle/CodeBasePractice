//
//  MovieView.swift
//  CodeBasePractice
//
//  Created by 쌩 on 6/9/24.
//

import UIKit

import SnapKit

class MovieView: UIView {
    
    let backgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "영사기")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let darkAlpha: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.5
        return view
    }()
    
    let textField = {
        let tf =  UITextField()
        tf.tintColor = .white
        tf.textColor = .white
        return tf
    }()
    
    lazy var underBarLineView: UIView = {
        let line = UIView()
        line.backgroundColor = .white
        return line
    }()

    let searchButton = {
        let bt = UIButton()
        bt.setTitle("검색", for: .normal)
        bt.setTitleColor(UIColor.black, for: .normal)
        bt.backgroundColor = .white
        bt.layer.cornerRadius = 10
        bt.layer.masksToBounds = true
        return bt
    }()
    
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        self.backgroundColor = .white
        configureHierachy()
        configureLayout()

        tableView.backgroundColor = .red
//        tableView.register(<#T##nib: UINib?##UINib?#>, forCellReuseIdentifier: <#T##String#>)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MovieView {
    private func configureHierachy() {
        self.addSubview(backgroundImageView)
        self.addSubview(darkAlpha)
        self.addSubview(textField)
        self.addSubview(searchButton)
        self.addSubview(tableView)
        textField.addSubview(underBarLineView)
    }
    private func configureLayout() {
        backgroundImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        darkAlpha.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        textField.snp.makeConstraints{
            $0.top.leading.equalTo(self.safeAreaLayoutGuide).inset(16)
            $0.height.equalTo(40)
            $0.trailing.equalTo(searchButton.snp.leading).offset(-16)
        }
        
        searchButton.snp.makeConstraints{
            $0.top.trailing.equalTo(self.safeAreaLayoutGuide).inset(16)
            $0.width.equalTo(80)
            $0.height.equalTo(40)
        }
        
        tableView.snp.makeConstraints{
            $0.top.equalTo(textField.snp.bottom).offset(16)
            $0.leading.trailing.bottom.equalTo(self.safeAreaLayoutGuide).inset(16)
        }
        underBarLineView.snp.makeConstraints{
            $0.top.equalTo(textField.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}
