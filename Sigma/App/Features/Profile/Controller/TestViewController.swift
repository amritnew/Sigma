//
//  TestViewController.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 23/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    let label:UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.text = "Testando isso aqui!"
        lbl.textColor = .black
        lbl.textAlignment = .center
//        lbl.backgroundColor = .blue
        return lbl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(label)
        setupContraints()
        // Do any additional setup after loading the view.
    }
    
    func setupContraints() {
        label.cBuild(make: .fillSuperview)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
