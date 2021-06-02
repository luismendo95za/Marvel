//
//  Loader.swift
//  Marvel
//
//  Created by Luis Alberto Mendoza Reyna on 31/5/21.
//

import Foundation
import Lottie


class Loader {
        
    var animationView: AnimationView? = .init(name: "loader_lottie")
        
    public func showLoader(context: UIViewController?) {
     
        animationView?.frame =  CGRect(x: (context?.view.frame.width ?? 0) / 2 - 100, y: (context?.view.frame.height ?? 0) / 2, width: 200, height: 200)
        animationView?.loopMode = .loop
        context?.view.addSubview(animationView ?? UIView())
        animationView?.play()
    }
    
    public func hiddeLoader() {
        animationView?.stop()
        animationView?.removeFromSuperview()
    }
}
