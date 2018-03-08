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

class ContactCardView: UIView {
    
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
    
    let botonPhone: UIButton = {
        let boton = UIButton(frame: .zero)
        boton.setTitle("Teléfono",for: .normal)
        boton.tintColor = .white
        boton.backgroundColor = UIColor(red:0.38, green:0.41, blue:0.59, alpha:1.00)
        boton.addTarget(self, action: #selector(llamadaTelefonica(button:)), for: .touchUpInside)
        return boton
    }()
    
    let botonLinkedin: UIButton = {
        let boton = UIButton(frame: .zero)
        boton.setTitle("Linkedin",for: .normal)
        boton.tintColor = .white
        boton.backgroundColor = UIColor(red:0.38, green:0.41, blue:0.59, alpha:1.00)
        boton.addTarget(self, action: #selector(accionLinkedin(button:)), for: .touchUpInside)
        return boton
    }()
    let botonTwitter: UIButton = {
        let boton = UIButton(frame: .zero)
        boton.setTitle("Twitter", for: .normal)
        boton.tintColor = .white
        boton.backgroundColor = UIColor(red:0.38, green:0.41, blue:0.59, alpha:1.00)
        boton.addTarget(self, action: #selector(accionTwitter(button:)), for: .touchUpInside)
        return boton
    }()
    @objc func llamadaTelefonica(button: UIButton) {
        let telefono = "5531321143"
        if let url = URL(string: "tel://\(telefono)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    @objc func accionLinkedin(button: UIButton) {
        let telefono = "http://www.linkedin.com/in/albertoluebbert"
        if let url = URL(string: "\(telefono)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    @objc func accionTwitter(button: UIButton) {
        let screenName =  "almsx"
        let appURL = NSURL(string: "twitter://user?screen_name=\(screenName)")!
        let webURL = NSURL(string: "https://twitter.com/\(screenName)")!
        let application = UIApplication.shared
        if application.canOpenURL(appURL as URL) {
            application.openURL(appURL as URL)
        } else {
            application.openURL(webURL as URL)
        }
    }
    func addSubviews() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(botonPhone)
        addSubview(botonLinkedin)
        addSubview(botonTwitter)
    }
    // MARK: Layout
    func setupLayout() {
        imageView.snp.makeConstraints {
            $0.top.left.right.equalTo(0)
            $0.width.equalTo(snp.width).multipliedBy(0.20)
            $0.height.equalTo(snp.height).multipliedBy(0.15)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(10)
            $0.left.equalTo(5)
            $0.right.equalTo(-5)
        }
        botonPhone.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.left.equalTo(20)
            $0.right.equalTo(-20)
            $0.bottom.lessThanOrEqualTo(-10)
        }
        botonLinkedin.snp.makeConstraints {
            $0.top.equalTo(botonPhone.snp.bottom).offset(20)
            $0.left.equalTo(20)
            $0.right.equalTo(-20)
            $0.bottom.lessThanOrEqualTo(-10)
        }
        botonTwitter.snp.makeConstraints {
            $0.top.equalTo(botonLinkedin.snp.bottom).offset(20)
            $0.left.equalTo(20)
            $0.right.equalTo(-20)
            $0.bottom.lessThanOrEqualTo(-10)
        }
    }
}
