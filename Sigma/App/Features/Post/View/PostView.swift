//
//  TopicView.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 28/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit
// import MarkdownView
import Markdowner

class PostView: UIView, ConfigurableView {
    
    var postViewModel: PostViewModel! {
        didSet {
            // markdownView.load(markdown: postViewModel.markdownText)
            markdownTextView.text = postViewModel.markdownText
        }
    }
    
    // let markdownView = MarkdownView()
    let markdownTextView = MarkdownTextView(fontSize: 18)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "Subackground")
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([
            markdownTextView // markdownView,
        ])
    }
    
    func setupConstraints() {
        // markdownView.fillSuperview()
        markdownTextView.fillSuperview(padding: UIEdgeInsets(top: 100, left: 20, bottom: 0, right: 20))
    }
}
