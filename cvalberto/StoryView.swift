//
//  StoryView.swift
//  mystory
//
//  Created by Alberto Luebbert M. on 07/03/18.
//  Copyright © 2018 Alberto Luebbert M. All rights reserved.
//

import UIKit
import Koloda
import SnapKit

class StoryView: UIView {
    
    init() {
        super.init(frame: .zero)
        addSubviews()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Subviews
    
    let kolodaView = KolodaView(frame: .zero)
    
    func addSubviews() {
        addSubview(kolodaView)
    }
    
    // MARK: Layout
    
    func setupLayout() {
        kolodaView.snp.makeConstraints {
            $0.edges.equalTo(UIEdgeInsets(top: 110, left: 20, bottom: 60, right: 20))
        }
    }
    
}

