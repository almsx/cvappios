//
//  BasicCardView.swift
//  mystory
//
//  Created by Alberto Luebbert M. on 07/03/18.
//  Copyright © 2018 Alberto Luebbert M. All rights reserved.
//

import UIKit
import Koloda
import SnapKit

class BasicCardView: UIView {
    
    init() {
        super.init(frame: .zero)
        addSubviews()
        setupLayout()
        clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.size.width / 32
    }
    
    // MARK: Subviews
    
    let imageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    func addSubviews() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(contentLabel)
    }
    
    // MARK: Layout
    
    func setupLayout() {
        imageView.snp.makeConstraints {
            $0.top.left.right.equalTo(0)
            $0.height.equalTo(snp.height).multipliedBy(0.65)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(10)
            $0.left.equalTo(5)
            $0.right.equalTo(-5)
        }
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.left.equalTo(20)
            $0.right.equalTo(-20)
            $0.bottom.lessThanOrEqualTo(-10)
        }
    }
    
}

