//
//  NotificationsWrapper.swift
//  WolfpackDigitalBaseProject
//
//  Created by Dan Ilies on 06/02/2020.
//  Copyright © 2020 Wolfpack Digital. All rights reserved.
//

import Foundation

protocol NotificationsWrapperProtocol: RawRepresentable {
    func register(object: Any, aSelector: Selector) -> Void
    func unregister(object: Any) -> Void
    func send() -> Void
    func send(userInfo: [String: Any]?) -> Void
}

extension NotificationsWrapperProtocol {
    // MARK: - Public methods
    
    func register(object: Any, aSelector: Selector) -> Void {
        NotificationCenter.default.addObserver(object, selector: aSelector, name: self.name(), object: nil)
    }
    
    func unregister(object: Any) -> Void {
        NotificationCenter.default.removeObserver(object, name: self.name(), object: nil)
    }
    
    func send() -> Void {
        self.send(userInfo: nil)
    }
    
    func send(userInfo: [String: Any]?) -> Void {
        NotificationCenter.default.post(name: self.name(), object: nil, userInfo: userInfo)
    }
    
    // MARK: - Private methods
    
    private func name() -> Notification.Name {
        return Notification.Name(self.rawValue as! String)
    }
}
