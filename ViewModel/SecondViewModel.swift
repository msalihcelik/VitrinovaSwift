//
//  SecondViewModel.swift
//  test13
//
//  Created by Mehmet Salih ÇELİK on 8.07.2021.
//

import Foundation

struct SecondViewModel {
    let home: Home
    
    var categoriesCount: Int {
        return self.home.categories!.count
    }
    func getTitle(_ index: Int) -> String {
        return (self.home.categories?[index].name)!
    }
    func getImageUrl(_ index: Int) -> String {
        return (self.home.categories?[index].logo?.url)!
    }
    
}
