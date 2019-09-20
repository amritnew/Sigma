//
//  SettingsControllers.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 18/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class SettingsController: BaseCollectionController {

//    lazy var settingsView:SettingsView = {
//        let view = SettingsView(frame: .zero)
//        view.tableView.delegate = self
//        view.tableView.dataSource = self
//        view.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        return view
//    }()
    
    let settingsViewModel = SettingsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(cellType: SettingsCells.self)
        self.collectionView.backgroundColor = .red
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: SettingsCells.self)
        return cell
    }
}


//extension SettingsController: UITableViewDataSource, UITableViewDelegate{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return settingsViewModel.numberOfRows()
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = settingsViewModel.optionFromIndexPath(indexPathRow: indexPath.row)
//        return cell
//    }
//
//
//}
