//
//  TopicController.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 14/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class PostController: UIViewController, ConfigurableController {
    
    var usedView: UIView? = PostView()
    
    var postViewModel = PostViewModel(post: Post(title: "Swift", markdownText: "# SWIFT BASICS\n## Froids\nTroll"))
    
    
    convenience init(post: Post) {
        self.init()
        postViewModel = PostViewModel(post: post)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindViewModel()
        navigationController?.navigationBar.tintColor = .actionColor
        setupNavigation()
    }
    
    fileprivate func setupNavigation() {
        navigationController?.navigationBar.tintColor = .init(red: 255/255, green: 69/255, blue: 58/255, alpha: 1)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "unliked"), style: .done, target: self, action: #selector(savePostInBookMark))
        }
        
    
    fileprivate func bindViewModel() {
        if let markView = usedView as? PostView {
            markView.postViewModel = postViewModel
            self.navigationItem.title = postViewModel.title
        }
    }
    
    
    @objc fileprivate func savePostInBookMark() {
        self.postViewModel.savePostAtBookmark()
    }
}
