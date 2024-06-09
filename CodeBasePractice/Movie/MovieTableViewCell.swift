//
//  MovieTableViewCell.swift
//  CodeBasePractice
//
//  Created by 쌩 on 6/9/24.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .cyan
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
