//
//  ActionSheetPresenter.swift
//  WolfpackDigitalBaseProject
//
//  Created by Dan Ilies on 06/02/2020.
//  Copyright © 2020 Wolfpack Digital. All rights reserved.
//

import UIKit

protocol ActionSheetPresenter where Self: UIViewController {
    func displayActionSheet(title: String?, message: String?,
                            actionsTitles: [String], actions: [(UIAlertAction) -> Void],
                            hasCancel: Bool)
}

extension ActionSheetPresenter {
    
    func displayActionSheet(title: String?, message: String?,
                            actionsTitles: [String], actions: [(UIAlertAction) -> Void],
                            hasCancel: Bool = true) {
        guard actionsTitles.count == actions.count else { return }
        let actionSheet = UIAlertController(title: title,
                                            message: message,
                                            preferredStyle: .actionSheet)
        
        for i in 0..<actions.count {
            let action = UIAlertAction(title: actionsTitles[i], style: .default, handler: actions[i])
            actionSheet.addAction(action)
        }
        
        if hasCancel {
            let cancelAlertAction = UIAlertAction(title: Strings.General.cancel, style: .cancel, handler: nil)
            actionSheet.addAction(cancelAlertAction)
        }
        
        actionSheet.view.tintColor = .appBlue
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
}
