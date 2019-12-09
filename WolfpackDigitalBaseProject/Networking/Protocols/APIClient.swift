//
//  APIClient.swift
//  WolfpackDigitalBaseProject
//
//  Created by Bianca Felecan on 06/12/2019.
//  Copyright © 2019 Wolfpack Digital. All rights reserved.
//

import Alamofire
import Foundation

// MARK: - API Client

/**
* General protocol used for API request/response management
* Implemented by Repositories that make API calls
*/
protocol APIClient {
    func performRequest<T: Decodable>(route: APIConfiguration, decoder: JSONDecoder,
                                      completion: @escaping (APIResponse<T>) -> Void)
    func performRequest(route: APIRouter, completion: @escaping (Bool, String?) -> ())
    func upload<T: Decodable>(route: APIRouter, decoder: JSONDecoder, completion: @escaping (APIResponse<T>) -> Void)
}

// MARK: - Default Implementation

extension APIClient {

    func performRequest<T: Decodable>(route: APIConfiguration, decoder: JSONDecoder = JSONDecoder(), completion: @escaping (APIResponse<T>) -> Void) {
        AF.request(route)
            .responseJSON(completionHandler: { (response) in
                print(response)
            })
            .response(completionHandler: { (response) in
                print(response.response?.statusCode)
            })
            .responseDecodable (decoder: decoder) { (response: AFDataResponse<T>) in
                self.parseResponse(response: response, completion: completion)
        }
    }

    func performRequest(route: APIRouter, completion: @escaping (Bool, String?) -> ()) {
        AF.request(route)
            .responseJSON(completionHandler: { (response) in
                completion(response.response?.statusCode == 200, response.error?.localizedDescription)
            })

    }

    func upload<T: Decodable>(route: APIRouter, decoder: JSONDecoder = JSONDecoder(), completion: @escaping (APIResponse<T>) -> Void) {
        guard let multipartData = route.multipartData else {
            completion(APIResponse.failure("The request doesn't contain any data"))
            return
        }
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(multipartData.data,
                                     withName: multipartData.name,
                                     fileName: multipartData.fileName,
                                     mimeType: multipartData.mimeType)
        }, with: route).uploadProgress(closure: { progress in
            print(progress)
        }).responseDecodable(decoder: decoder) { (response: AFDataResponse<T>) in
            self.parseResponse(response: response, completion: completion)
        }
    }

    // MARK: - Private functions

    private func parseResponse<T: Decodable>(response: AFDataResponse<T>,
                                             completion: @escaping (APIResponse<T>) -> Void) {
        if let error = self.checkError(response: response) {
            if error.error.code == "401" {
                // self.refreshToken(response: response, error: error, completion: completion)
            } else {
                completion(APIResponse.failure(error.localizedDescription))
            }
        } else {
            switch response.result {
            case .success(let data):
                completion(APIResponse<T>.success(data))
            case .failure(let error):
                completion(APIResponse.failure(error.localizedDescription))
            }
        }
    }

    private func checkError<T>(response: AFDataResponse<T>) -> APIError? {
        if let statusCode = response.response?.statusCode,
            statusCode >= 300,
            let data = response.data,
            let error = try? JSONDecoder().decode(APIError.self, from: data) {

            return error
        }
        return nil
    }
}
