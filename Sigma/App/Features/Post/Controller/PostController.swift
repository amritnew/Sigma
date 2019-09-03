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
    }
    
    fileprivate func bindViewModel() {
        if let markView = usedView as? PostView {
            markView.postViewModel = postViewModel
            self.navigationItem.title = postViewModel.title
        }
    }

}
