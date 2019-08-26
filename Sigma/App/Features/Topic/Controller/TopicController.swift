//
//  TopicController.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 14/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit
import MarkdownView

class TopicController: UIViewController {
    
    let mdView = MarkdownView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mdView)
        mdView.translatesAutoresizingMaskIntoConstraints = false
        mdView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mdView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mdView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mdView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        let session = URLSession(configuration: .default)
        let url = URL(string: "https://raw.githubusercontent.com/matteocrippa/awesome-swift/master/README.md")!
        let task = session.dataTask(with: url) { [weak self] data, _, _ in
            let str = String(data: data!, encoding: String.Encoding.utf8)
            DispatchQueue.main.async {
                self?.mdView.load(markdown: str)
            }
        }
        task.resume()
    }
}
