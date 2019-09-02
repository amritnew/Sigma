//
//  TopicView.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 28/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit
import MarkdownView

class PostView: UIView, ConfigurableView {
    
    var postViewModel: PostViewModel! {
        didSet {
            markdownView.load(markdown: postViewModel.markdownText)
        }
    }
    
    let markdownView = MarkdownView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([markdownView])
    }
    
    func setupConstraints() {
        markdownView.fillSuperview()
    }
}
