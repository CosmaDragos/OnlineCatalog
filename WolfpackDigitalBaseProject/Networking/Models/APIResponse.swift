//
//  APIResponse.swift
//  WolfpackDigitalBaseProject
//
//  Created by Bianca Felecan on 06/12/2019.
//  Copyright © 2020 Wolfpack Digital. All rights reserved.
//

import Foundation

/**
 * Generic response model
 * Expected by Repositories, no matter the status code of the server response
 */
struct APIResponse<DataModel> {
    let success: Bool
    let message: String?
    let data: DataModel?
    
    static func success<DataModel>(_ data: DataModel?) -> APIResponse<DataModel> {
        return APIResponse<DataModel>(success: true, message: nil, data: data)
    }
    
    static func failure(_ message: String?, _ data: DataModel? = nil) -> APIResponse<DataModel> {
        return APIResponse<DataModel>(success: false, message: message, data: data)
    }
    
}
