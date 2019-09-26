//
//  RoundableImage.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 13/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit


class RoundableImage: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        self.layer.cornerRadius = self.frame.height / 5
        self.layer.masksToBounds = true
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.shadowRadius = 8
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOpacity = 1
    }
}

extension UIAlertController {
    static func createActionSheet(title: String, message: String) -> UIAlertController {
        let actionSheet = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        actionSheet.view.backgroundColor = .backgroundColor
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: { _ in
            actionSheet.dismiss(animated: true, completion: nil)
        }))
        return actionSheet
    }
    
}
