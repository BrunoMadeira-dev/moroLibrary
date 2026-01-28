//
//  Networking.swift
//  MoroLibrary
//
//  Created by Bruno Madeira on 28/01/2026.
//


import Foundation
import UIKit


enum NetworkError: Error {
    case badResponse
    case badStatusCode(Int)
    case badData
}

final class NetworkingCall {
    
    static let shared = NetworkingCall()
    private let session: URLSession
    
    init() {
        let config = URLSessionConfiguration.default
        session = URLSession(configuration: config)
    }
    
    func responseCall<T: Codable> (url: String, responseType: T.Type) async throws -> T {
        guard let url = URL(string: url) else {
            throw NetworkError.badResponse
        }
        
        let (data, response) = try await session.data(from: url)
        
        guard let httpReponse = response as? HTTPURLResponse else {
            throw NetworkError.badResponse
        }
        
        guard(200...299).contains(httpReponse.statusCode) else {
            throw NetworkError.badStatusCode(httpReponse.statusCode)
        }
        
        return try JSONDecoder().decode(responseType, from: data)
    }
    
    func fetchImage(url: String) async throws -> UIImage {
        
        guard let url = URL(string: url) else {
            throw NetworkError.badResponse
        }
        
        let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode),
              let image = UIImage(data: data) else {
                  throw NetworkError.badData
              }
        
        
        return image
    }
}
