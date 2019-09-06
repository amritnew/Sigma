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
            let markdownView = MarkdownTextView(fontSize: 16)
            markdownView.text = postViewModel.markdownText
            postTextView.attributedText = markdownView.attributedString()
        }
    }
    
    lazy var postTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.backgroundColor = UIColor(named: "Subackground")
        
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "Subackground")
        buildViewHierarchy()
        setupConstraints()
        if #available(iOS 10.0, *) {
            postTextView.adjustsFontForContentSizeCategory = true
        }
        DispatchQueue.main.async {
            self.postTextView.setContentOffset(.zero, animated: false)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([
            postTextView
        ])
    }
    
    func setupConstraints() {
        postTextView.fillSuperview(padding: UIEdgeInsets(top: 100, left: 20, bottom: 0, right: 20))
    }
}
