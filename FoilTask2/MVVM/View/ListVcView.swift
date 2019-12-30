//
//  ListVcView.swift
//  FoilTask2
//
//  Created by Mena Gamal on 12/30/19.
//  Copyright © 2019 Mena Gamal. All rights reserved.
//

import Foundation
import UIKit

protocol ListVcView {
    
    var listStackView: UIStackView!{
        get set
    }
    
    var viewModel: ListViewModel! {
        get set
    }
    
    func update(state: ListViewModel.Action)

    
}
