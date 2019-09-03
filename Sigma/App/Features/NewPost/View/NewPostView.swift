//
//  NewPostView.swift
//  Sigma
//
//  Created by Mario Matheus on 03/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit
import Markdowner

class NewPostView: UIView, ConfigurableView {
    
    var viewModel = NewPostViewModel(viewTitle: "New Post")
    let markdownTextView = MarkdownTextView(fontSize: 18)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        markdownTextView.delegate = self
        markdownTextView.text = viewModel.markdownText
        backgroundColor = UIColor(named: "Background")
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([
            markdownTextView
        ])
    }
    
    func setupConstraints() {
        markdownTextView.fillSuperview(padding: UIEdgeInsets(top: 100, left: 20, bottom: 0, right: 20))
    }
    
    func getPostFromTextView() -> Post {
        return Post(title: "Preview", markdownText: viewModel.markdownText)
    }
    
}


extension NewPostView: UITextViewDelegate {
    
    public func textViewDidChange(_ textView: UITextView) {
        viewModel.markdownText = textView.text ?? ""
    }
    
}
