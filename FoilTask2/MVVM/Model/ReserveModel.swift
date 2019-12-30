//
//  ReserveModel.swift
//  FoilTask2
//
//  Created by Mena Gamal on 12/30/19.
//  Copyright © 2019 Mena Gamal. All rights reserved.
//

import Foundation


struct ReserveModel {
 
    var id:Int?
    
//  MARK: BINARY SEARCH MUST BE SORTED
    
    func BinarySearch(list:[ReserveModel],id:Int) -> Int {
        var left = 0
        var right = list.count - 1

        while left <= right {

            let middle = Int(floor(Double(left + right) / 2.0))

            if list[middle].id! < id {
                left = middle + 1
            } else if list[middle].id! > id {
                right = middle - 1
            } else {
                return middle
            }
        }
        return -1
    }
    
}
