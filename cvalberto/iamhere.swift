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
import MapKit

class HereView: UIView {
    
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
    
   let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Titulo"
        return label
    }()
    
    let mapa: MKMapView = {
        let mapa = MKMapView(frame: .zero)
        
        mapa.mapType = MKMapType.standard
        mapa.isZoomEnabled = true
        mapa.isScrollEnabled = true
        return mapa
    }()
    
    
    func addSubviews() {
        addSubview(titleLabel)
        addSubview(mapa)
    }
    
    // MARK: Layout
    func setupLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.left.right.equalTo(0)
            $0.width.equalTo(snp.width).multipliedBy(0.20)
            $0.height.equalTo(snp.height).multipliedBy(0.15)
        }
        mapa.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.left.equalTo(20)
            $0.right.equalTo(-20)
            $0.bottom.lessThanOrEqualTo(-10)
        }
    }
}

