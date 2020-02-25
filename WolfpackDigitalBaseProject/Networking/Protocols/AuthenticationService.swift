//
//  AuthenticationService.swift
//  WolfpackDigitalBaseProject
//
//  Created by Bianca Felecan on 06/12/2019.
//  Copyright © 2020 Wolfpack Digital. All rights reserved.
//

import UIKit

protocol AuthenticationServiceProtocol {
    var token: String? { get }
}

class AuthenticationService: AuthenticationServiceProtocol {
    
    static let shared = AuthenticationService()
    
    var token: String? {
        return "my token"
    }
}
