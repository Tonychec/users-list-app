//
//  ULATableView.swift
//  users list app
//
//  Created by iosNomad on 8/12/18.
//  Copyright © 2018 iosNomad. All rights reserved.
//

import UIKit
import SMPullToRefresh

//MARK: Refresh
extension UITableView {
        func addPullToRefresh(style: UIActivityIndicatorViewStyle = .white, _ action: @escaping ()->Void) {
            let refreshView = ULARefreshView()
            refreshView.translatesAutoresizingMaskIntoConstraints = false
            refreshView.autoresizingMask = [.flexibleWidth]
            refreshView.frame.size.height = kPullRefreshViewHeight
            refreshView.activityIndicator.activityIndicatorViewStyle = style
            
            let pullToRefresh = PullToRefresh(refreshView: refreshView, animator: ULARefreshViewAnimator(refreshView: refreshView), height: kPullRefreshViewHeight, position: .top)
            addPullToRefresh(pullToRefresh, action: action)
        }
    
        func endPullRefreshing() {
            DispatchQueue.main.asyncAfter(deadline: .now() + kDefaultAnimationDuration) { [weak self] in
                self?.endRefreshing(at: .top)
            }
        }
    
        func startPullRefreshing() {
            startRefreshing(at: .top)
        }
    
        var isPullRefresing: Bool {
            if let topPullToRefresh = self.topPullToRefresh {
                return topPullToRefresh.state == .loading
            }
            
            return false
    }
}
