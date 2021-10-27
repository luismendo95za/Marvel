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
    let contentView = UIView()
    
    public func showLoader(context: UIViewController?) {
        contentView.frame = context?.view.frame ?? CGRect()
        contentView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        animationView?.frame =  CGRect(x: (context?.view.frame.width ?? 0) / 2 - 100, y: (context?.view.frame.height ?? 0) / 2, width: 200, height: 200)
        animationView?.loopMode = .loop
        contentView.isHidden = false
        contentView.addSubview(animationView ?? UIView())
        context?.view.addSubview(contentView)
        animationView?.play()
    }
    
    public func hiddeLoader() {
        contentView.isHidden = true
        animationView?.stop()
        animationView?.removeFromSuperview()
    }
}
