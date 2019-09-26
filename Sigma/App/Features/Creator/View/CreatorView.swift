//
//  CreatorView.swift
//  Sigma
//
//  Created by aluno on 26/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

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
        image.heightAnchor.constraint(equalToConstant: 300).isActive = true
       return image
    }()
    
    fileprivate let cardPost: CardView = {
           let cardView = CardView(title: "Write a new Post", messsage: "Write a single post and share something you consider cool with other developers!", icon: UIImage())
           cardView.heightAnchor.constraint(equalToConstant: 120).isActive = true
           return cardView
       }()
    
    fileprivate let cardTrail: CardView = {
        let cardView = CardView(title: "Create a new Trail", messsage: "Create a group of topics on a trail to guide people to learn something amazing!", icon: UIImage())
        cardView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        return cardView
    }()
    
    
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
        
        cardPost.cBuilder { (make) in
                  make.top.equal(to: imageBanner.bottomAnchor, offsetBy: 20)
                  make.leading.equal(to: leadingAnchor, offsetBy: 10)
                  make.trailing.equal(to: trailingAnchor, offsetBy: -10)
              }
              
        cardTrail.cBuilder { (make) in
            make.top.equal(to: cardPost.bottomAnchor, offsetBy: 20)
            make.leading.equal(to: leadingAnchor, offsetBy: 10)
            make.trailing.equal(to: trailingAnchor, offsetBy: -10)
        }
    }
}
