//
//  VideoCardView.swift
//  mystory
//
//  Created by Alberto Luebbert M. on 07/03/18.
//  Copyright © 2018 Alberto Luebbert M. All rights reserved.
//

import UIKit
import SnapKit
import Koloda
import youtube_ios_player_helper

class VideoCardView: UIWebView {
    
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
        label.font = UIFont.systemFont(ofSize: 40)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let endingVideo: YTPlayerView = {
        let videoId = "b9434BoGkNQ"
        let playerVars = ["playsinline": 1]
        let video = YTPlayerView(frame: .zero)
        video.load(withVideoId: videoId, playerVars: playerVars)
        return video
    }()
    
    func addSubviews() {
        addSubview(titleLabel)
        addSubview(endingVideo)
    }
    
    // MARK: Layout
    
    func setupLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.left.right.equalTo(0)
            $0.height.equalTo(snp.height).multipliedBy(0.3)
        }
        endingVideo.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.left.right.equalTo(0)
            $0.bottom.equalTo(0)
        }
    }
    
}

