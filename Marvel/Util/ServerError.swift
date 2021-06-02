//
//  ServerError.swift
//  Marvel
//
//  Created by Luis Alberto Mendoza Reyna on 31/5/21.
//

import Foundation
import Alamofire


final class ServerError {
    
    static func proccessError(error: AFError, context: UIViewController?) {
        
        let alert = UIAlertController(title: "Error: \(error.responseCode ?? 0)",
                                      message: error.localizedDescription,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
        context?.present(alert, animated: true, completion: nil)
    }
}
