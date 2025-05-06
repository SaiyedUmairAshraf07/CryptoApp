//
//  CoinaAPIService.swift
//  Dashboard
//
//  Created by cedcoss on 4/20/25.
//

import Foundation

class APIService {
    
    static let shared = APIService()
    
    
    private init() {}
    
    func fetchCoinData(perPage: Int, page: Int,completeion: @escaping ([Coin]?) -> Void) {
        
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=\(perPage)&page=\(page)&sparkline=false"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                // Print raw JSON as String
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("Raw JSON string:\n\(jsonString)")
                }
                
                // Optional: pretty print JSON
//                if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
//                   let prettyData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted),
//                   let prettyString = String(data: prettyData, encoding: .utf8) {
//                    print("Pretty JSON:\n\(prettyString)")
//                }
                
                // Decode to model
                let coins = try? JSONDecoder().decode([Coin].self, from: data)
                DispatchQueue.main.async {
                    completeion(coins)
                }
            } else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                completeion(nil)
            }
        }.resume()
    }
}
