//
//  CreatorView.swift
//  Sigma
//
//  Created by aluno on 26/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit


protocol CreatorViewDelegate: class {
    func didTappedToPost()
    func didTappedToTrail()
}

class CreatorView: UIView, ConfigurableView {
    fileprivate let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .actionColor
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.widthAnchor.constraint(equalToConstant: 7).isActive = true
        return view
    }()
    
    fileprivate let messageLabel = UILabel(text: "Teach Something", textColor: .white, font: .boldSystemFont(ofSize: 32), numberOfLines: nil, lineBreakMode: nil)
    
    fileprivate let imageBanner: UIImageView = {
       let image = UIImageView(image: UIImage(named: "creator"))
       image.contentMode = .scaleAspectFit
       return image
    }()
    
    fileprivate lazy var cardPost: CardView = {
           let cardView = CardView(title: "Write a new Post", messsage: "Write a single post and share something you consider cool with other developers!", icon: #imageLiteral(resourceName: "postIcon"))
           cardView.isUserInteractionEnabled = true
        cardView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTappedToPost)))
           return cardView
       }()
    
    fileprivate lazy var cardTrail: CardView = {
        let cardView = CardView(title: "Create a new Trail", messsage: "Create a group of topics on a trail to guide people to learn something amazing!", icon: #imageLiteral(resourceName: "trailIcon"))
        cardView.isUserInteractionEnabled = true
        cardView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTappedToTrail)))
        return cardView
    }()
    
    weak var delegate: CreatorViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .backgroundColor
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
          addSubviews([lineView, messageLabel, imageBanner, cardPost, cardTrail])
      }
      
      func setupConstraints() {
        lineView.cBuilder { (make) in
            make.top.equal(to: topAnchor, offsetBy: 100)
            make.leading.equal(to: leadingAnchor, offsetBy: 20)
        }
        
        messageLabel.cBuilder { (make) in
            make.leading.equal(to: lineView.trailingAnchor, offsetBy: 10)
            make.top.equal(to: lineView.topAnchor, offsetBy: 2)
        }
        
        imageBanner.cBuilder { (make) in
            make.top.equal(to: messageLabel.bottomAnchor, offsetBy: 10)
        }
        
        imageBanner.cBuild(make: .centerXInSuperView)
        
        
        imageBanner.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        
        cardPost.cBuilder { (make) in
                  make.top.equal(to: imageBanner.bottomAnchor, offsetBy: 20)
                  make.leading.equal(to: leadingAnchor, offsetBy: 10)
                  make.trailing.equal(to: trailingAnchor, offsetBy: -10)
              }
        
        cardPost.heightAnchor.constraint(equalTo: imageBanner.heightAnchor, multiplier: 0.6).isActive = true
              
        cardTrail.cBuilder { (make) in
            make.top.equal(to: cardPost.bottomAnchor, offsetBy: 20)
            make.leading.equal(to: leadingAnchor, offsetBy: 10)
            make.trailing.equal(to: trailingAnchor, offsetBy: -10)
        }
        cardTrail.heightAnchor.constraint(equalTo: imageBanner.heightAnchor, multiplier: 0.6).isActive = true
    }
}

extension CreatorView {
    
    @objc fileprivate func didTappedToPost() {
        delegate?.didTappedToPost()
    }
    
    @objc fileprivate func didTappedToTrail() {
        delegate?.didTappedToTrail()
    }
    
}
