//
//  FourthViewModel.swift
//  test13
//
//  Created by Mehmet Salih ÇELİK on 8.07.2021.
//

import Foundation

struct FourthViewModel {
    let home: Home
    
    var shopsCount: Int {
        return self.home.shops!.count
    }
    func getTitle(_ index: Int) -> String {
        return (self.home.shops?[index].name)!
    }
    func getSubTitle(_ index: Int) -> String {
        return (self.home.shops?[index].definition)!
    }
    func getImageUrl1(_ index: Int) -> String {
        return (self.home.shops?[index].logo?.url)!
    }
    func getImageUrl2(_ index: Int) -> String {
        return (self.home.shops?[index].popular_products?[0].images?[0].url)!
    }
    func getImageUrl3(_ index: Int) -> String {
        return (self.home.shops?[index].popular_products?[1].images?[0].url)!
    }
    func getImageUrl4(_ index: Int) -> String {
        return (self.home.shops?[index].popular_products?[2].images?[0].url)!
    }
    func getImageUrlBg(_ index: Int) -> String {
        return (self.home.shops?[index].cover?.url)!
    }
}
