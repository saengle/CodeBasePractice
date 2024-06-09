//
//  MovieTableViewCell.swift
//  CodeBasePractice
//
//  Created by 쌩 on 6/9/24.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    let rankBoxLabel = {
        let lb = UILabel()
        lb.backgroundColor = .white
        lb.font = .boldSystemFont(ofSize: 17)
        lb.text = "1"
        lb.textAlignment = .center
        return lb
    }()
    
    let movieTitleLabel = {
        let lb = UILabel()
        lb.textColor = .white
        lb.font = .boldSystemFont(ofSize: 17)
        lb.text = "제목 테스트용입니다 만약 아주아주 긴글 긴ㄱ들 긴글 이라면 ?"
        return lb
    }()
    
    let movieOpenDateLabel = {
        let lb = UILabel()
        lb.textColor = .white
        lb.font = .systemFont(ofSize: 12)
        lb.textAlignment = .right
        lb.text = "2020-02-02"
        return lb
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        configureHierachy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MovieTableViewCell {
    private func configureLayout() {
        rankBoxLabel.snp.makeConstraints {
            $0.centerY.leading.equalToSuperview()
            $0.width.equalTo(36)
        }
        movieTitleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(rankBoxLabel.snp.trailing).offset(16)
            $0.trailing.equalTo(movieOpenDateLabel.snp.leading).offset(-12)
        }
        movieOpenDateLabel.snp.makeConstraints {
            $0.centerY.trailing.equalToSuperview()
            $0.width.equalTo(72)
        }
    }
    private func configureHierachy() {
        contentView.addSubview(rankBoxLabel)
        contentView.addSubview(movieTitleLabel)
        contentView.addSubview(movieOpenDateLabel)
    }
}
