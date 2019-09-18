//
//  SettingsView.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 18/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class SettingsView: UICollectionViewCell,Reusable,ConfigurableView {
    
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([tableView])
    }
    
    func setupConstraints() {
        tableView.cBuilder { (make) in
            make.bottom.equal(to: self.bottomAnchor)
            make.leading.equal(to: self.leadingAnchor)
            make.trailing.equal(to: self.trailingAnchor)
            make.top.equal(to: self.topAnchor)
        }
    }

}
