//
//  ProgressCardView.swift
//  mystory
//
//  Created by Alberto Luebbert M. on 07/03/18.
//  Copyright © 2018 Alberto Luebbert M. All rights reserved.
//

import UIKit
import Koloda
import SnapKit
import MBCircularProgressBar

class ProgressCardView: UIView {
    
    init() {
        super.init(frame: .zero)
        addSubviews()
        setupLayout()
        configureButtonActions()
        clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.size.width / 32
    }
    
    // MARK: Actions
    
    typealias ButtonAction = () -> Void
    
    var topButtonAction: ButtonAction?
    var middleButtonAction: ButtonAction?
    var bottomButtonAction: ButtonAction?
    
    private func configureButtonActions() {
        topButton.addTarget(self, action: #selector(topButtonDidTap), for: .touchUpInside)
        middleButton.addTarget(self, action: #selector(middleButtonTap), for: .touchUpInside)
        bottomButton.addTarget(self, action: #selector(bottomButtonTap), for: .touchUpInside)
    }
    
    @objc private func topButtonDidTap() {
        topButtonAction?()
    }
    
    @objc private func middleButtonTap() {
        middleButtonAction?()
    }
    
    @objc private func bottomButtonTap() {
        bottomButtonAction?()
    }
    
    // MARK: Subviews
    
    let topProgressView = ProgressCardView.createProgressView()
    let middleProgressView = ProgressCardView.createProgressView()
    let bottomProgressView = ProgressCardView.createProgressView()
    
    private static func createProgressView() -> MBCircularProgressBarView {
        let view = MBCircularProgressBarView(frame: .zero)
        view.progressLineWidth = 1.9
        view.progressRotationAngle = 50
        //prueba
        view.backgroundColor = UIColor(red:0.12, green:0.18, blue:0.33, alpha:1.0)
        //view.backgroundColor = UIColor(red:0.22, green:0.26, blue:0.40, alpha:1.0)
        view.fontColor = .white
        view.unitFontSize = 15
        view.emptyLineStrokeColor = .black
        view.maxValue = 100
        view.unitString = "%"
        view.progressAngle = 100
        view.contentMode = .scaleAspectFit
        return view
    }
    
    private static func createImageButton() -> UIButton {
        let button = UIButton(frame: .zero)
        button.layer.borderWidth = 1
        //button.layer.borderColor = UIColor(red:0.86, green:0.38, blue:0.53, alpha:1.0).cgColor
        button.layer.borderColor = UIColor(red:1.0, green:1.0, blue:1.0, alpha:1.0).cgColor
        
        button.layer.cornerRadius = 10
        return button
    }
    
    let topButton = ProgressCardView.createImageButton()
    let middleButton = ProgressCardView.createImageButton()
    let bottomButton = ProgressCardView.createImageButton()
    
    func addSubviews() {
        addSubview(topProgressView)
        addSubview(middleProgressView)
        addSubview(bottomProgressView)
        addSubview(topButton)
        addSubview(middleButton)
        addSubview(bottomButton)
    }
    
    // MARK: Layout
    
    func setupLayout() {
        topProgressView.snp.makeConstraints {
            $0.top.equalTo(40)
            $0.left.equalTo(40)
            $0.size.equalTo(CGSize(width: 100, height: 100))
        }
        middleProgressView.snp.makeConstraints {
            $0.top.equalTo(topProgressView.snp.bottom).offset(55)
            $0.left.equalTo(40)
            $0.size.equalTo(topProgressView.snp.size)
        }
        bottomProgressView.snp.makeConstraints {
            $0.top.equalTo(middleProgressView.snp.bottom).offset(55)
            $0.left.equalTo(40)
            $0.size.equalTo(topProgressView.snp.size)
            $0.bottom.lessThanOrEqualTo(-20)
        }
        topButton.snp.makeConstraints {
            $0.top.equalTo(40)
            $0.right.equalTo(-40)
            $0.left.equalTo(topProgressView.snp.right).offset(40)
            $0.size.equalTo(topProgressView.snp.size)
        }
        middleButton.snp.makeConstraints {
            $0.top.equalTo(topButton.snp.bottom).offset(55)
            $0.right.equalTo(-40)
            $0.left.equalTo(middleProgressView.snp.right).offset(40)
            $0.size.equalTo(topButton.snp.size)
        }
        bottomButton.snp.makeConstraints {
            $0.top.equalTo(middleButton.snp.bottom).offset(55)
            $0.right.equalTo(-40)
            $0.left.equalTo(bottomProgressView.snp.right).offset(40)
            $0.size.equalTo(topButton.snp.size)
            $0.bottom.lessThanOrEqualTo(-20)
        }
        
    }
    
}

