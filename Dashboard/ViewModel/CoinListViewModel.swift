//
//  CoinListViewModel.swift
//  Dashboard
//
//  Created by cedcoss on 4/20/25.
//

import Foundation

class CoinListViewModel {
    
    private(set) var coins: [Coin] = []
    
     var isFecthingData: Bool = false
    
     var onDataUpdated: (() -> Void)?
    
     var perPage : Int = 50
    
     var page : Int = 1
    
    func fetchCoins() {
        
        //preventing double api call
        guard !isFecthingData else {return}
        isFecthingData = true
        onDataUpdated?()
        
        APIService.shared.fetchCoinData(perPage: perPage, page: page, completeion: { [weak self] newCoins in
            
            guard let self = self , let newCoins = newCoins else {return}
            self.coins.append(contentsOf: newCoins)
            self.page += 1
            self.isFecthingData = false
            self.onDataUpdated?()
            
            print ("Coin Data Fetched: \(self.coins.count)")
        })
    }
}
