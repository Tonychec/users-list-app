//
//  ULABaseDataViewController.swift
//  users list app
//
//  Created by iosNomad on 8/12/18.
//  Copyright © 2018 iosNomad. All rights reserved.
//

import UIKit
import SMDataDiller
import Alamofire


class ULABaseDataViewController: UIViewController {
    
    var dataSource: SMBaseDataSource!
    var dataProvider: SMBaseDataProvider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDataDiller()
    }
    
    func createDataRequest() -> DataRequest? {
        fatalError("Need to implement in subclass")
    }
}


//MARK: - SMDataSourceDelegate
extension ULABaseDataViewController: SMDataSourceDelegate {
    
    @objc public var contentView: UIView {
        fatalError("Need to implement in subclass")
    }
    
    @objc public func iDataSource() -> SMBaseDataSource {
        fatalError("Need to implement in subclass")
    }
    
    @objc public func iDataProvider() -> SMBaseDataProvider {
        fatalError("Need to implement in subclass")
    }
    
    private func setupDataDiller() {
        dataSource = iDataSource()
        dataProvider = iDataProvider()
        
        dataSource.dataProvider = dataProvider
        dataSource.delegate = self
        
        if let dataSource = dataSource as? SMBaseTableViewDataSource {
            if let tableView = contentView as? UITableView {
                dataSource.tableView = tableView
            }
            
        } else if let dataSource = dataSource as? SMBaseCollectionViewDataSource {
            
            if let collectionView = contentView as? UICollectionView {
                dataSource.collectionView = collectionView
            }
        }
    }
    
    func dataSource(_ dataSource: SMBaseDataSource!, didSelectRowAt indexPath: IndexPath!, withItem item: Any!) {
        print("did selected item: \(item)")
    }
}
