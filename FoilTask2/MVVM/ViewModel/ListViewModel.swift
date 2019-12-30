//
//  ListViewModel.swift
//  FoilTask2
//
//  Created by Mena Gamal on 12/30/19.
//  Copyright © 2019 Mena Gamal. All rights reserved.
//


import Foundation
import UIKit

class ListViewModel {
    
    var view:ListVcView!
    
    var listModels = [ReserveModel]()
    
    var model = ReserveModel()
    
    // MARK: UPDATE THE VIEW
    public enum Action {
        case  searchResult(str: String)
    }
    
    init(view:ListVcView) {
        self.view = view
        for i in 1...11 {
            let model = ReserveModel(id: i)
            self.listModels.append(model)
        }
    }
    
    func search(id:Int)  {
        let result = model.BinarySearch(list: listModels, id: id)
        if result == -1 {
            self.view.update(state: .searchResult(str: "The Id is not found in the list"))
        } else {
            self.view.update(state: .searchResult(str: "The Id is found in the list at \(result)"))
        }
    }
    
    func LoadData() {
        for item in listModels {
            let cell = ListView.loadFromNib(named: "ListView") as! ListView
            cell.bottomView.isHidden = true
            cell.labelId.text = "#\(item.id!)"
            
            cell.topView.addTapGestureRecognizer {
                
                if cell.bottomView.isHidden {
                    cell.bottomView.isHidden = false
                    UIView.animate(withDuration: 1.0, delay:0, options: .curveEaseOut, animations: {
                        
                        self.view.listStackView.layoutIfNeeded()
                    })
                    
                } else {
                    cell.bottomView.isHidden = true
                    UIView.animate(withDuration: 1.0, delay:0, options: .curveEaseOut, animations: {
                        
                        self.view.listStackView.layoutIfNeeded()
                    })
                }
                
            }
            self.view.listStackView.addArrangedSubview(cell)
        }
    }
    
    
}
