//
//  APIRouter.swift
//  WolfpackDigitalBaseProject
//
//  Created by Bianca Felecan on 06/12/2019.
//  Copyright © 2019 Wolfpack Digital. All rights reserved.
//

import Alamofire

/**
 * Router that defines our API calls
 */
enum APIRouter: APIConfiguration {

    // MARK: - Cases

    // Define your cases here
    // ex:  case register(request: RegisterRequestBody)
    //      case sendSomething(id: String, request: SomeRequest)

    // MARK: - API Configuration

    var baseUrl: String {
        return "http://yourbase.com/api/v1/"
    }
    
    var method: HTTPMethod {
        switch self {
            // ex case .register: return .post
        }
    }

    var path: String {
        switch self {
            // ex case .register: return "shopperaccount/?skipJwt=true"
        }
    }

    var headers: [String: String] {
        var headers: [String: String] = [:]
        if let token = authService.token {
            headers["Authorization"] = token
            print(token)
        }
        headers["Content-Type"] = "application/json"

        return headers
    }

    var parameters: Parameters? {
        switch self {
        // ex: case .register(let request): return request.params
        }
    }

    var multipartData: MultipartData? {
        switch self {
        // ex:
        // case .postImage(let photoData):
        //    return MultipartData(data: photoData, name: "picture", fileName: "picture.jpg", mimeType: "image/jpeg")
        }
    }

    var authService: AuthenticationServiceProtocol {
        return AuthenticationService.shared
    }

}
