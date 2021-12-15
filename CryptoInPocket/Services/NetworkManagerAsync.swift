//
//  NetworkManagerAsync.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 15/12/2021.
//

import Foundation

class NetworkManagerAsync {
    static let shared = NetworkManagerAsync()
    
    private init() {}
    
    // Exchange's related fetching
    
    func fetchExchanges() async throws -> [Exchange] {
        
       guard let values = try? await fetchData(
        dataType: AllExchangesDescription.self,
        from: Route.baseURL.rawValue + Route.exchangesAll.rawValue,
        convertFromSnake: false
       ).exchanges else { throw NetworkError.noData }
       
        return values
    }
    
    func fetchExchangeBy(id: String) async throws -> Exchange {
        guard let data = try? await fetchData(
            dataType: RemoteExchange.self,
            from: Route.baseURL.rawValue + Route.exchangesAll.rawValue +  "/" +  id ,
            convertFromSnake: false) else { throw NetworkError.noData}
        return data.exchange
    }
}

//MARK: - Privates methods
extension NetworkManagerAsync {
    private func fetchData<T:Codable>(dataType: T.Type, from url: String, convertFromSnake: Bool) async throws -> T {
        guard let url = URL(string: url) else { throw NetworkError.invalidUrl }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            
            if convertFromSnake {
                decoder.keyDecodingStrategy = .convertFromSnakeCase
            }
            guard let type = try? decoder.decode(T.self, from: data) else {
                throw NetworkError.decodingError
            }
            return type
        } catch {
            throw NetworkError.noData
        }
        
    }
}


enum NetworkError: Error {
    case invalidUrl
    case noData
    case decodingError
}

enum Route: String {
    case baseURL = "https://www.cryptingup.com/api"
    case exchangesAll = "/exchanges"
    case marketsAll = "/markets"
    case currenciesAll = "/assets"
    case currenciesNamesList = "/assetsoverview"
}

