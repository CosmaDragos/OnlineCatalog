//
//  EncodableExtensions.swift
//  Snapbuy
//
//  Created by Dan Ilies on 22/09/2019.
//  Copyright © 2019 Snapbuy. All rights reserved.
//

import Foundation

extension Encodable {
    
    subscript(key: String) -> Any? {
        return params[key]
    }
    
    var params: [String: Any] {
        let encoder = JSONEncoder()
        //encoder.keyEncodingStrategy = .convertToSnakeCase
        //encoder.dateEncodingStrategy = .formatted(DateFormatter.fullDateFormatter)
        return (try? JSONSerialization.jsonObject(with: encoder.encode(self))) as? [String: Any] ?? [:]
    }
    
    var data: Data? {
        let encoder = JSONEncoder()
        let jsonObject = (try? JSONSerialization.jsonObject(with: encoder.encode(self))) as? [String: Any] ?? [:]
        let data = try? JSONSerialization.data(withJSONObject: jsonObject, options: [])
        return data
    }
    
}

extension Data {
    var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
            let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
            let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
        
        return prettyPrintedString
    }
}
