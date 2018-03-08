//
//  StoryViewController.swift
//  cvalberto
//
//  Created by Alberto Luebbert M. on 07/03/18.
//  Copyright © 2018 Alberto Luebbert M. All rights reserved.
//


import UIKit
import Koloda
import AVFoundation
import MBCircularProgressBar
import Foundation
import MessageUI

class StoryViewController: UIViewController, KolodaViewDataSource, KolodaViewDelegate, MFMailComposeViewControllerDelegate {
    
    // MARK: View
    
    var storyView: StoryView! {
        return view as? StoryView
    }
    
    override func loadView() {
        view = StoryView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CV Alberto Luebbert"
        //navigationController?.navigationBar.barTintColor = UIColor(red:0.20, green:0.40, blue:0.64, alpha:1.0)
        //navigationController?.navigationBar.barTintColor = UIColor(red:0.12, green:0.29, blue:0.56, alpha:1.0)
        navigationController?.navigationBar.barTintColor = UIColor(red:0.16, green:0.22, blue:0.43, alpha:1.0)
        
        
        storyView.kolodaView.delegate = self
        storyView.kolodaView.dataSource = self
        //storyView.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
        //storyView.backgroundColor = UIColor(red:0.58, green:0.60, blue:0.64, alpha:1.0)
        storyView.backgroundColor = UIColor(red:0.88, green:0.89, blue:0.93, alpha:1.0)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(resetCards))
    }
    
    @objc func resetCards() {
        storyView.kolodaView.resetCurrentCardIndex()
    }
    
    // MARK: KolodaViewDataSource
    
    var dataSource: [CardType] = [ .welcome, .basic0, .basic1, .basic2, .basic3, .basic4,
                                   .progress0, .rating, .video]
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return dataSource.count
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .moderate
    }
    
    // swiftlint:disable:next cyclomatic_complexity
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        //let backgroundColorCard = UIColor(red:0.22, green:0.26, blue:0.40, alpha:1.0)
        let backgroundColorCard = UIColor(red:0.12, green:0.18, blue:0.33, alpha:1.0)
        //let backgroundColorTitle = UIColor(red:0.89, green:0.02, blue:0.02, alpha:1.0)
        //let backgroundColorTitle = UIColor(red:0.12, green:0.18, blue:0.33, alpha:1.0)
        let backgroundColorTitle = UIColor(red:0.32, green:0.49, blue:0.96, alpha:1.0)
        let type = dataSource[index]
        switch type {
        case .welcome:
            let view = WelcomeCardView()
            view.backgroundColor = backgroundColorCard
            view.imageView.image = UIImage(named: "selfieAlb")
            view.titleLabel.text = "Alberto Luebbert M."
            view.titleLabel.textColor = .white
            view.contentLabel.text = "Desarrollador iOS"
            view.contentLabel.textColor = backgroundColorTitle
            return view
        case .basic0:
            let view = BasicCardView()
            view.backgroundColor = backgroundColorCard
            view.imageView.image = UIImage(named: "selfieAlb")
            view.titleLabel.text = "Acerca de Alberto"
            view.titleLabel.textColor = backgroundColorTitle
            view.contentLabel.text = "Conferencista de TI desde el año 2004. Desarrollador de Aplicaciones Móviles " +
            "desde 2011 para iOS y Android. En el último año he trabajado con iOS Nativo <3 utilizando Swift 3. "
            return view
        case .basic1:
            let view = BasicCardView()
            view.backgroundColor = backgroundColorCard
            view.imageView.image = UIImage(named: "neza")
            view.titleLabel.text = "¿De donde eres?"
            view.titleLabel.textColor = backgroundColorTitle
            view.contentLabel.text = "Originario de la Ciudad de México desde el año 1987, llego a vivir a la hermana republica de Ciudad Nezahualcoyotl, Estado de México. " +
            "En esta fotografía aerea se puede observar como es la longitud de este municipio que hoy día es donde vivo."
            return view
        case .basic2:
            let view = BasicCardView()
            view.backgroundColor = backgroundColorCard
            view.imageView.image = UIImage(named: "conferencia")
            view.titleLabel.text = "¿Porque Conferencista de TI?"
            view.titleLabel.textColor = backgroundColorTitle
            view.contentLabel.text = "He tenido la oportunidad de compartir conocimientos en eventos en México como Campus Party, Aldea Digital, UNAM, IPN, UAM, Tec de Mty, UVM entre otras instituciones educativas a través de Conferencias y talleres."
            return view
        case .basic3:
            let view = BasicCardView()
            view.backgroundColor = backgroundColorCard
            view.imageView.image = UIImage(named: "trabajo")
            view.titleLabel.text = "¿Donde has trabajado?"
            view.titleLabel.textColor = backgroundColorTitle
            view.contentLabel.text = "He trabajado para Grupo Carso, Bayer de México, Walmart de México, Cinepolis Chile, Cinepolis Indía. Actualmente colaboro para DataMédica, una startup de salud con un concepto similar a Uber."
            return view
        case .basic4:
            let view = ContactCardView()
            view.backgroundColor = backgroundColorCard
            view.imageView.image = UIImage(named: "AppIcon")
            view.titleLabel.text = "¿Cómo te contacto?"
            view.titleLabel.textColor = backgroundColorTitle
            return view
        case .progress0:
            let view = ProgressCardView()
            //view.titleLabel.text = "¿Con que tecnologias trabajo?. Presiona el Icono"
            //view.titleLabel.textColor = UIColor(red:0.89, green:0.02, blue:0.02, alpha:1.0)
            view.topProgressView.value = 0
            view.middleProgressView.value = 0
            view.bottomProgressView.value = 0
            let swiftLogo = UIImage(named: "swiftLogo")
            view.topButton.setImage(swiftLogo, for: .normal)
            view.topButtonAction = {
                UIView.animate(withDuration: 1) {
                    view.topProgressView.value = 50
                }
            }
            let jsLogo = UIImage(named: "jsLogo")
            view.middleButton.setImage(jsLogo, for: .normal)
            view.middleButtonAction = {
                UIView.animate(withDuration: 1) {
                    view.middleProgressView.value = 90
                }
            }
            let githubLogo = UIImage(named: "pythonLogo")
            view.bottomButton.setImage(githubLogo, for: .normal)
            view.bottomButtonAction = {
                UIView.animate(withDuration: 1) {
                    view.bottomProgressView.value = 60
                }
            }
            view.backgroundColor = backgroundColorCard
            return view
        case .rating:
            let view = RatingCardView()
            view.backgroundColor = backgroundColorCard
            view.imageView.image = UIImage(named: "paraiso")
            view.titleLabel.text = "¡Gracias!"
            view.contentLabel.text = "Por utilizar la aplicación!"
            view.titleLabel.backgroundColor = backgroundColorTitle
            view.likeClosureAction = { [weak self] in
                self?.presentLikeAlert()
            }
            view.dislikeClosureAction = { [weak self] in
                self?.presentDislikeAlert()
            }
            return view
        case .video:
            let video = VideoCardView()
            video.titleLabel.text = "¡Esto es todo amigos!"
            video.titleLabel.textColor = backgroundColorTitle
            video.titleLabel.backgroundColor = backgroundColorCard
            return video
        }
    }
    
    private func presentDislikeAlert() {
        let alert = UIAlertController(title: "CV Alberto",
                                      message: "Ya casi terminamos 🍺",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .cancel))
        present(alert, animated: true)
    }
    
    private func presentLikeAlert() {
        let alert = UIAlertController(title: "CV Alberto",
                                      message: "Estamos por terminar...",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK 🍺", style: .destructive, handler: { [weak self] (_) in
            self?.presentNextCard()
        }))
        present(alert, animated: true)
    }
    
    private func presentNextCard() {
        storyView.kolodaView.swipe(.left)
    }
}

enum CardType {
    case welcome
    case basic0
    case basic1
    case basic2
    case basic3
    case basic4
    case progress0
    case rating
    case video
}
