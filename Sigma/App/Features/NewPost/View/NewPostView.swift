//
//  NewPostView.swift
//  Sigma
//
//  Created by Mario Matheus on 03/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit
import Markdowner

protocol NewPostViewDelegate: class {
    func previewMarkdownDidAppear()
    func previewMarkdownDidDisappear()
}

class NewPostView: UIView, ConfigurableView {
    
    weak var delegate: NewPostViewDelegate?
    
    var viewModel = NewPostViewModel(viewTitle: "New Post")
    lazy var markdownTextView = MarkdownTextView(fontSize: viewModel.fontSize)
    
    lazy var previewPostView: PostView = {
        let viewPostView = PostView()
        viewPostView.postViewModel = PostViewModel(post: Post(title: self.viewModel.viewTitle, markdownText: self.viewModel.markdownText))
        return viewPostView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        markdownTextView.delegate = self
        markdownTextView.text = viewModel.markdownText
        markdownTextView.tintColor = .red
        backgroundColor = .background
        buildViewHierarchy()
        setupConstraints()
        setDoneOnKeyboard()
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
    
    func postBarButtonDidPressed(title: String, comeFrom: ComeFrom, trailViewModel: TrailViewModel? , completion: @escaping (Bool) -> Void) {
        switch comeFrom {
        case .newToTrail:
            viewModel.saveBlogPost(title: title, completion: { completion($0) })
        case .postToTrail:
            viewModel.saveBlogPost(title: title, completion: {
                var trail = Trail(title: trailViewModel!.title, description: "Description", author: trailViewModel!.author, topics: trailViewModel!.topics)
                trail.trailId = trailViewModel!.trailId
                
                self.viewModel.associateBlogPost(to: trail, title: "Introduction", completion: { (_) in
                    print("Fodeu")
                })
                completion($0)
            })
            
            
        }
    }
    
    func previewBarButtonDidPressed() {
        addSubview(previewPostView)
        UIView.animate(withDuration: 0.8, delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0.8, options: .curveEaseOut,
                       animations: { [weak self] in
                        self?.previewPostView.fillSuperview()
                        self?.previewPostView.frame.origin.y -= self?.frame.height ?? UIScreen.main.bounds.height
        }, completion: { [weak self] _ in
            self?.delegate?.previewMarkdownDidAppear()
            self?.viewModel.previewing = true
        })
    }
    
    func closePreviewBarButtonDidPressed() {
        if viewModel.previewing {
            UIView.animate(withDuration: 0.8, delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0.8, options: .curveEaseIn,
                           animations: { [weak self] in
                            self?.previewPostView.frame.origin.y += self?.frame.height ?? UIScreen.main.bounds.height
                }, completion: { [weak self] _ in
                    self?.previewPostView.removeFromSuperview()
                    self?.delegate?.previewMarkdownDidDisappear()
                    self?.viewModel.previewing = false
            })
        }
    }
    
    var cursorPosition: CGPoint {
        if let cursorPosition = markdownTextView.selectedTextRange?.start {
            let rect = markdownTextView.caretRect(for: cursorPosition)
            return rect.origin
        }
        return .zero
    }
    
}


extension NewPostView: UITextViewDelegate {
    
    public func textViewDidChange(_ textView: UITextView) {
        viewModel.markdownText = textView.text ?? ""
    }
    
    func keyboardWillShow(keyboardRect: CGRect) {
        if let superview = markdownTextView.superview,
            let bottomConstraint = superview.constraints.filter({ $0.firstAttribute == NSLayoutConstraint.Attribute.bottom }).first {
                superview.removeConstraint(bottomConstraint)
                markdownTextView.bottomAnchor.constraint(
                    equalTo: superview.bottomAnchor,
                    constant: -(keyboardRect.height + (markdownTextView.inputAccessoryView?.frame.height ?? 0) + 8)
                    ).isActive = true
        }
    }
    
    @objc func dismissKeyboard() {
        if let superview = markdownTextView.superview,
            let bottomConstraint = superview.constraints.filter({ $0.firstAttribute == NSLayoutConstraint.Attribute.bottom }).first {
            superview.removeConstraint(bottomConstraint)
            markdownTextView.bottomAnchor.constraint(
                equalTo: superview.bottomAnchor).isActive = true
        }
        markdownTextView.resignFirstResponder()
    }
    
    func setDoneOnKeyboard() {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        markdownTextView.inputAccessoryView = keyboardToolbar
    }
    
}
