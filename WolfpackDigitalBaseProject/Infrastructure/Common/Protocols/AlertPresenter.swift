//
//  AlertPresenter.swift
//  
//
//  Created by Dan Ilies on 21/09/2019.
//  Copyright © 2020 Wolfpack Digital. All rights reserved.
//

import UIKit

/**
 * Presents UIAlertControllers where necessary
 */
protocol AlertPresenter where Self: UIViewController {
    func displayAlert(title:String, message:String, completion:((UIAlertAction) -> Swift.Void)?)
    func displayYesNoAlert(title: String, message: String, yes: @escaping (_ action: UIAlertAction) -> Void, no: @escaping (_ action: UIAlertAction) -> Void)
}

extension AlertPresenter {
    
    func displayAlert(title:String = "Info", message:String, completion:((UIAlertAction) -> Swift.Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: completion)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func displayYesNoAlert(title: String, message: String, yes: @escaping (_ action: UIAlertAction) -> Void, no: @escaping (_ action: UIAlertAction) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let yesAction = UIAlertAction(title: "Yes", style: .default, handler: yes)
        let noAction = UIAlertAction(title: "No", style: .default, handler: no)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
