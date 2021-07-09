//
//  ThirdViewModel.swift
//  test13
//
//  Created by Mehmet Salih ÇELİK on 8.07.2021.
//

import Foundation

struct ThirdViewModel {
    let home: Home
    
    var collectionsCount: Int {
        return self.home.collections!.count
    }
    func getTitle(_ index: Int) -> String {
        return (self.home.collections?[index].title)!
    }
    func getSubTitle(_ index: Int) -> String {
        return (self.home.collections?[index].definition)!
    }
    func getImageUrl(_ index: Int) -> String {
        return (self.home.collections?[index].cover?.url)!
    }
}
