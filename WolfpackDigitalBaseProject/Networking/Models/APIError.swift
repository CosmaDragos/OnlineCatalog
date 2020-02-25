//
//  APIError.swift
//  WolfpackDigitalBaseProject
//
//  Created by Bianca Felecan on 06/12/2019.
//  Copyright © 2020 Wolfpack Digital. All rights reserved.
//

import Foundation

/**
* Generic error response model
*/
struct APIError: Decodable, LocalizedError {
    
    let error: CustomError
    
    struct CustomError: Decodable {
        let code: String
        let message: String?
        let userMessage: String
    }
    
}

