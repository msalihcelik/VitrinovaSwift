//
//  FirstViewModel.swift
//  test13
//
//  Created by Mehmet Salih ÇELİK on 8.07.2021.
//

import Foundation

struct FirstViewModel {
    let home: Home
    
    var productsCount: Int {
        return self.home.products!.count
    }
    func getTitle(_ index: Int) -> String {
        return (self.home.products?[index].title)!
    }
    func getSubTitle(_ index: Int) -> String {
        return (self.home.products?[index].shop?.name)!
    }
    func getImageUrl(_ index: Int) -> String {
        return (self.home.products?[index].images?[0].url)!
    }
    func getPrice(_ index: Int) -> String {
        return String((self.home.products?[index].price)!) + " TL"
    }
    func getOldPrice(_ index: Int) -> String {
        if (self.home.products?[index].old_price) != nil {
            return String((self.home.products?[index].old_price)!) + " TL"
        }
        return ""
    }
}
