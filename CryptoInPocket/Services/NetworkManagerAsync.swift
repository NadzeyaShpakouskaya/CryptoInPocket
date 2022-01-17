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
        let url = createBaseURL(for: .exchanges)
        guard let values = try? await fetchData(
            dataType: AllExchangesDescription.self,
            from: url,
            convertFromSnake: false
        ) else { throw NetworkError.noData }
        
        return values.exchanges
    }
    
    
    func fetchExchangeBy(id: String) async throws -> Exchange {
        let url = createBaseURL(for: .exchanges, with: id)
        guard let data = try? await fetchData(
            dataType: RemoteExchange.self,
            from: url,
            convertFromSnake: false) else { throw NetworkError.noData}
        return data.exchange
    }
    
    func fetchMarketsForExchange(id: String) async throws -> [Market] {
        let url = createBaseURL(for: .exchanges, with: id, forMarkets: true)
        guard let values = try? await fetchData(
            dataType: AllMarketsDescription.self,
            from: url,
            convertFromSnake: false
        ) else { throw NetworkError.noData }
        return values.markets
    }
    
    func fetchCurrencies() async throws -> [Currency] {
        let url = createBaseURL(for: .currencies)
        guard let values = try? await fetchData(
            dataType: AllCurrenciesDescription.self,
            from: url,
            convertFromSnake: false
        ) else { throw NetworkError.noData }
        
        return values.assets
    }

    func fetchCurrenciesByPage(itemPerPage: Int, lastFetched: Int) async throws -> [Currency] {
        let url = createPaginationURL(for: .currencies, itemPerPage: itemPerPage, lastFetched: lastFetched)
        guard let values = try? await fetchData(
            dataType: AllCurrenciesDescription.self,
            from: url,
            convertFromSnake: false
        ) else { throw NetworkError.noData }
        
        return values.assets
    }
    
    func fetchCurrencyBy(id: String) async throws -> Currency {
        let url = createBaseURL(for: .currencies, with: id, forMarkets: false)
        guard let data = try? await fetchData(
            dataType: RemoteCurrency.self,
            from: url,
            convertFromSnake: false) else { throw NetworkError.noData}
        return data.asset
    }
    
    func fetchMarketsForCurrency(id: String) async throws -> [Market] {
        let url = createBaseURL(for: .currencies, with: id, forMarkets: true)
        guard let values = try? await fetchData(
            dataType: AllMarketsDescription.self,
            from: url,
            convertFromSnake: false
        ) else { throw NetworkError.noData }
        return values.markets
    }
    
    func fetchAssetsData() async throws -> [AssetData] {
        let url = createBaseURL(for: .currenciesFullList)
        guard let values = try? await fetchData(
            dataType: AssetsData.self,
            from: url,
            convertFromSnake: false
        ) else { throw NetworkError.noData}
        return values.assets
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
    

    private func createBaseURL(for route: Route, with id: String? = nil, forMarkets: Bool = false) -> String {
        var path = ""
        if let id = id {
            path = "/api" + route.rawValue + "/" + id
        } else {
           path = "/api" + route.rawValue
        }
        if forMarkets {
            path += "/markets"
        }

        var components = URLComponents()
        components.scheme = "https"
        components.host = "www.cryptingup.com"
        components.path = path
        return components.url?.absoluteString ?? ""
    }
    
    private func createPaginationURL(for route: Route, itemPerPage: Int, lastFetched: Int) -> String {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "www.cryptingup.com"
        components.path = "/api" + route.rawValue
        components.queryItems = [
            URLQueryItem(name: "size", value: String(itemPerPage)),
            URLQueryItem(name: "start", value: String(lastFetched))
        ]
        return components.url?.absoluteString ?? ""
    }
}


enum NetworkError: Error {
    case invalidUrl
    case noData
    case decodingError
}

enum Route: String {
//    case baseURL = "https://www.cryptingup.com/api"
    case exchanges = "/exchanges"
//    case marketsAll = "/markets"
    case currencies = "/assets"
    case currenciesFullList = "/assetsoverview"
}



