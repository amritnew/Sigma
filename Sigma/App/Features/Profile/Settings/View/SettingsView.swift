//
//  SettingsView.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 18/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class SettingsView: ContainerRowCell, ConfigurableView {
    
    let settingsViewModel = SettingsViewModel()
    
    override var scrollEnable: Bool {
        didSet {
            tableView.isScrollEnabled = scrollEnable
        }
    }
//    weak var containerDelegate: ContainerActionsDelegate?
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.dataSource = self
        table.delegate = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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

extension SettingsView: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsViewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = settingsViewModel.optionFromIndexPath(indexPathRow: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let caseSetting = SettingsOptions.getCase(withIndex: indexPath.row)
        
        containerDelegate?.tappedInSettings(withOption: caseSetting)
    }
}
