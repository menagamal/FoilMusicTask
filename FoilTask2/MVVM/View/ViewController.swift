//
//  ViewController.swift
//  FoilTask2
//
//  Created by Mena Gamal on 12/30/19.
//  Copyright © 2019 Mena Gamal. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,ListVcView {
    
    @IBOutlet weak var textfieldSearch: UITextField!
    @IBOutlet weak var listStackView: UIStackView!
    
    var viewModel: ListViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ListViewModel(view: self)
        viewModel.LoadData()
    }
    
    @IBAction func didWrite(_ sender: Any) {
        if let id = Int(textfieldSearch.text!) {
            viewModel.search(id: id)
        }
    }
    
    func update(state: ListViewModel.Action) {
        switch state {
        case .searchResult(let str):
            Toast.showAlert(viewController: self, text: str)
        }
    }
    
    
}

