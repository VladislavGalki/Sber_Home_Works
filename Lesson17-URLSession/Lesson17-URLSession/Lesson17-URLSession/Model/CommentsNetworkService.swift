//
//  CommentsNetworkService.swift
//  Lesson17-URLSession
//
//  Created by Владислав Галкин on 02.06.2021.
//

import Foundation

final class CommentsNetworkService {
    private let session: URLSession = .shared
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        //decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

extension CommentsNetworkService: CommentsNetworkProtocol {
   
    typealias Handler = (Data?, URLResponse?, Error?) -> Void
    
    func getComments(completion: @escaping (GetCommentsApiResponse) -> Void) {
        let component = URLComponents(string: Constants.CommentsAPIMethods.getComments)
        
        guard let url = component?.url else { completion(GetCommentsApiResponse.failure(.networkError)); return }
        
        let request = URLRequest(url: url)
        //request.httpMethod = "GET"
        
        let handler: Handler = { data, response, error in
            
            do {
                let data = try self.httpResponse(data: data, response: response)
                let response = self.decodeJson(type: [GetCommentsResponse].self, from: data)
                if let response = response {
                    completion(.success(response))
                }
            } catch {
                completion(.failure(NetworkServiceError.decodable))
            }
        }
        session.dataTask(with: request, completionHandler: handler).resume()
    }
    
    private func decodeJson<T: Decodable>(type: T.Type, from: Data?) -> T? {
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let data = from , let result = try? decoder.decode(type.self, from: data) else { return nil }
        return result
    }
    
    private func httpResponse(data: Data?, response: URLResponse?) throws -> Data {
        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode),
              let data = data else {
            throw NetworkServiceError.networkError
        }
        return data
    }
}
