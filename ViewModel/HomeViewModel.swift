//
//  HomeViewModel.swift
//  test13
//
//  Created by Mehmet Salih ÇELİK on 8.07.2021.
//

import Foundation

struct HomeViewModel {
    let home: Home
    
    var featuredCount: Int {
        return self.home.featured!.count
    }
    func getTitle(_ index: Int) -> String {
        return (self.home.featured?[index].title)!
    }
    func getSubTitle(_ index: Int) -> String {
        return (self.home.featured?[index].sub_title)!
    }
    func getImageUrl(_ index: Int) -> String {
        return (self.home.featured?[index].cover?.url)!
    }
    
}
