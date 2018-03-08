//
//  RatingCardView.swift
//  mystory
//
//  Created by Alberto Luebbert M. on 07/03/18.
//  Copyright © 2018 Alberto Luebbert M. All rights reserved.
//

import UIKit
import Koloda
import SnapKit

class RatingCardView: UIView {
    
    init() {
        super.init(frame: .zero)
        addSubviews()
        setupLayout()
        configureActions()
        clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.size.width / 32
    }
    
    // MARK: Action
    
    var likeClosureAction: (() -> Void)?
    var dislikeClosureAction: (() -> Void)?
    
    @objc func didTapLikeButton() {
        likeClosureAction?()
    }
    
    @objc func didTapDislikeButton() {
        dislikeClosureAction?()
    }
    
    // MARK: Subviews
    
    let imageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        //view.contentMode = .scaleAspectFit
        view.contentMode = .scaleToFill
        view.clipsToBounds = true
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 30)
        //label.textColor = UIColor(red:0.86, green:0.38, blue:0.53, alpha:1.0)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let likeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "yesImage"), for: .normal)
        return button
    }()
    
    let dislikeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "noImage"), for: .normal)
        return button
    }()
    
    private func configureActions() {
        likeButton.addTarget(self, action: #selector(didTapLikeButton), for: .touchUpInside)
        dislikeButton.addTarget(self, action: #selector(didTapDislikeButton), for: .touchUpInside)
    }
    
    private func addSubviews() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(contentLabel)
        addSubview(likeButton)
        addSubview(dislikeButton)
    }
    
    // MARK: Layout
    
    private func setupLayout() {
        imageView.snp.makeConstraints {
            $0.top.left.right.equalTo(0)
            $0.height.equalTo(snp.height).multipliedBy(0.5)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom)
            $0.left.right.equalTo(0)
        }
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.left.right.equalTo(0)
        }
        likeButton.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(50)
            $0.right.equalTo(-50)
            $0.size.equalTo(CGSize(width: 60, height: 60))
        }
        dislikeButton.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(50)
            $0.left.equalTo(50)
            $0.size.equalTo(likeButton.snp.size)
            
        }
        
    }
}

