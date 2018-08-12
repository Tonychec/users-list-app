//
//  ULARefreshView.swift
//  users list app
//
//  Created by iosNomad on 8/12/18.
//  Copyright © 2018 iosNomad. All rights reserved.
//

import UIKit


class ULARefreshView: UIView {
    
    private(set) lazy var activityIndicator: UIActivityIndicatorView! = {
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
        addSubview(activityIndicator)
        return activityIndicator
    }()
    
    override func layoutSubviews() {
        centerActivityIndicator()
        setupFrame(in: superview)
        
        super.layoutSubviews()
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        centerActivityIndicator()
        setupFrame(in: superview)
    }
    
    func setupFrame(in newSuperview: UIView?) {
        guard let superview = newSuperview else {
            return
        }
        
        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: superview.frame.width, height: frame.height)
    }
    
    func centerActivityIndicator() {
        activityIndicator.center = convert(center, from: superview)
    }
}
