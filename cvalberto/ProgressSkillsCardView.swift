//
//  ProgressSkillsViewCard.swift
//  mystory
//
//  Created by Alberto Luebbert M. on 07/03/18.
//  Copyright © 2018 Alberto Luebbert M. All rights reserved.
//

import UIKit
import Koloda
import SnapKit
import MBCircularProgressBar

class ProgressSkillsCardView: UIView {
    
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
    
    let topProgressSkillsView = ProgressSkillsCardView.createProgressSkillsView()
    let middleProgressSkillsView = ProgressSkillsCardView.createProgressSkillsView()
    let bottomProgressSkillsView = ProgressSkillsCardView.createProgressSkillsView()
    
    private static func createProgressSkillsView() -> MBCircularProgressBarView {
        let view = MBCircularProgressBarView(frame: .zero)
        view.progressLineWidth = 1.9
        view.progressRotationAngle = 50
        view.fontColor = .white
        view.progressColor = UIColor(red:0.86, green:0.38, blue:0.53, alpha:1.0)//UIColor(red:0.86, green:0.38, blue:0.53, alpha:1.0)
        view.emptyLineStrokeColor = .black
        view.maxValue = 100
        view.unitString = "%"
        view.progressAngle = 100
        view.contentMode = .scaleAspectFit
        return view
    }
    
    private static func createTitleSkillsButton() -> UIButton {
        let button = UIButton(frame: .zero)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor
        button.layer.cornerRadius = 10
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.textAlignment = .center
        return button
    }
    
    let topButton = ProgressSkillsCardView.createTitleSkillsButton()
    let middleButton = ProgressSkillsCardView.createTitleSkillsButton()
    let bottomButton = ProgressSkillsCardView.createTitleSkillsButton()
    
    func addSubviews() {
        addSubview(topProgressSkillsView)
        addSubview(middleProgressSkillsView)
        addSubview(bottomProgressSkillsView)
        addSubview(topButton)
        addSubview(middleButton)
        addSubview(bottomButton)
    }
    
    // MARK: Layout
    
    func setupLayout() {
        topProgressSkillsView.snp.makeConstraints {
            $0.top.equalTo(40)
            $0.left.equalTo(40)
            $0.size.equalTo(CGSize(width: 100, height: 100))
        }
        middleProgressSkillsView.snp.makeConstraints {
            $0.top.equalTo(topProgressSkillsView.snp.bottom).offset(55)
            $0.left.equalTo(40)
            $0.size.equalTo(topProgressSkillsView.snp.size)
        }
        bottomProgressSkillsView.snp.makeConstraints {
            $0.top.equalTo(middleProgressSkillsView.snp.bottom).offset(55)
            $0.left.equalTo(40)
            $0.size.equalTo(topProgressSkillsView.snp.size)
            $0.bottom.lessThanOrEqualTo(-20)
        }
        topButton.snp.makeConstraints {
            $0.top.equalTo(40)
            $0.right.equalTo(-40)
            $0.left.equalTo(topProgressSkillsView.snp.right).offset(40)
            $0.size.equalTo(CGSize(width: 180, height: 100))
        }
        middleButton.snp.makeConstraints {
            $0.top.equalTo(topButton.snp.bottom).offset(55)
            $0.right.equalTo(-40)
            $0.left.equalTo(middleProgressSkillsView.snp.right).offset(40)
            $0.size.equalTo(topButton.snp.size)
        }
        bottomButton.snp.makeConstraints {
            $0.top.equalTo(middleButton.snp.bottom).offset(55)
            $0.right.equalTo(-40)
            $0.left.equalTo(bottomProgressSkillsView.snp.right).offset(40)
            $0.size.equalTo(topButton.snp.size)
            $0.bottom.lessThanOrEqualTo(-20)
        }
        
    }
    
}

