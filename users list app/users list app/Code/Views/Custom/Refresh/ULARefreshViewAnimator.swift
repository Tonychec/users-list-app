//
//  ULARefreshViewAnimator.swift
//  users list app
//
//  Created by iosNomad on 8/12/18.
//  Copyright © 2018 iosNomad. All rights reserved.
//

import Foundation
import SMPullToRefresh


class ULARefreshViewAnimator: RefreshViewAnimator {
    
    private let refreshView: ULARefreshView
    
    init(refreshView: ULARefreshView) {
        self.refreshView = refreshView
    }
    
    func animate(_ state: State) {
        switch state {
        case .initial:
            refreshView.activityIndicator.stopAnimating()
            
        case .releasing(let progress):
            refreshView.activityIndicator.isHidden = false
            
            var transform = CGAffineTransform.identity
            transform = transform.scaledBy(x: progress, y: progress)
            transform = transform.rotated(by: CGFloat(Double.pi) * progress * 2)
            refreshView.activityIndicator.transform = transform
            
        case .loading:
            refreshView.activityIndicator.startAnimating()
            
        default:
            break
        }
    }
}

