//
//  BioCellSpec.swift
//  AppTests
//
//  Created by Guilherme Araujo on 18/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
@testable import Sigma

class BioCollectionViewCellSpec: QuickSpec {
    override func spec() {
        describe("Test of BioCollectionViewCell") {
            it("Not in the originally modeled way") {
                let frame = CGRect(x: 0, y: 0, width: 300, height: 100)
                let view  = BioCollectionViewCell(frame: frame)
                view.backgroundColor = .subBackground
                expect(view) == recordSnapshot("Bio")
            }
            
        }
    }
}
