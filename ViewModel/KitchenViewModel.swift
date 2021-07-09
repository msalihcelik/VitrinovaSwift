//
//  KitchenViewModel.swift
//  test13
//
//  Created by Mehmet Salih ÇELİK on 8.07.2021.
//

import Foundation

struct KitchenViewModel {
    let home: Home
    
    var shopsCount: Int {
        return self.home.shops!.count
    }
    func getImageUrl(_ index: Int) -> String? {
        return (self.home.shops?[index].cover?.url)
    }
    func getLogoImageUrl(_ index: Int) -> String? {
            return (self.home.shops?[index].logo?.url)
    }
    func getTitle(_ index: Int) -> String {
        return (self.home.shops?[index].name)!
    }
    func getSubTitle(_ index: Int) -> String {
        return (self.home.shops?[index].definition)!
    }
    func getProductCount(_ index: Int) -> String {
        if (self.home.shops?[index].definition) != nil {
            return String((self.home.shops?[index].product_count)!) + " ÜRÜN"
        }
        return ""
    }
}
