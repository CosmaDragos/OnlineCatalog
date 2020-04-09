//
//  NotificationsWrapper.swift
//  WolfpackDigitalBaseProject
//
//  Created by Dan Ilies on 06/02/2020.
//  Copyright © 2020 Wolfpack Digital. All rights reserved.
//

import Foundation

protocol NotificationsWrapperProtocol: RawRepresentable {
    func register(object: Any, aSelector: Selector)
    func unregister(object: Any)
    func send()
    func send(userInfo: [String: Any]?)
}

extension NotificationsWrapperProtocol {
    // MARK: - Public methods

    func register(object: Any, aSelector: Selector) {
        NotificationCenter.default.addObserver(object, selector: aSelector, name: self.name(), object: nil)
    }

    func unregister(object: Any) {
        NotificationCenter.default.removeObserver(object, name: self.name(), object: nil)
    }

    func send() {
        self.send(userInfo: nil)
    }

    func send(userInfo: [String: Any]?) {
        NotificationCenter.default.post(name: self.name(), object: nil, userInfo: userInfo)
    }

    // MARK: - Private methods

    private func name() -> Notification.Name {
        return Notification.Name(self.rawValue as! String)
    }
}
