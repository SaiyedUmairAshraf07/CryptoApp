//
//  Coin.swift
//  Dashboard
//
//  Created by cedcoss on 4/20/25.
//

import Foundation


struct Coin: Codable {
    
    var id: String
    var name: String
    var symbol: String
    var image: String
    var current_price: Double
    var market_cap: Double
    var total_volume: Double

}
