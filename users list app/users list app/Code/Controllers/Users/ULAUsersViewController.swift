//
//  ULAUsersViewController.swift
//  users list app
//
//  Created by iosNomad on 8/9/18.
//  Copyright © 2018 iosNomad. All rights reserved.
//

import UIKit
import SMDataDiller

class ULAUsersViewController: ULABaseDataViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var paginator: ULAPaginator!
    
    init() {
        super.init(nibName: String(describing: ULAUsersViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = ULAStrings.Tabs.users.rawValue
        usersDataSource.reload {
            self.setupPaginator()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        usersDataSource.reload()
    }
}

//MARK: - SMDataDiller
extension ULAUsersViewController {
    
    override var contentView: UIView {
        return tableView
    }
    
    override func iDataProvider() -> SMBaseDataProvider {
        return ULAUsersDataProvider()
    }
    
    override func iDataSource() -> SMBaseDataSource {
        return ULAUsersDataSource()
    }
    
    var usersDataSource: ULAUsersDataSource {
        return dataSource as! ULAUsersDataSource
    }
    
    override func dataSource(_ dataSource: SMBaseDataSource!, didSelectRowAt indexPath: IndexPath!, withItem item: Any!) {
        guard let user = item as? ULAUser else {
            return
        }
        
        let editUserVC = ULAEditViewController(user: user)
        editUserVC.saveCallBack = { savedUser in
            self.tabBarController?.selectedIndex = 1
        }
        navigationController?.pushViewController(editUserVC, animated: true)
    }
}

//MARK: - paginator
extension ULAUsersViewController {
    
    @objc func setupPaginator() {
        paginator = ULAPaginator(withTableView: tableView, entityName: ULAUser.entityName(), listTaskCreationHandler: ULAAPI.shared.loadUsersListCreationHendler)
        
        paginator.refreshListHandler = { [unowned self] (error) in
            if let error = error {
                ULAAlert.showAlert(withText: error.localizedDescription, at: self)
            } else {
                self.usersDataSource.reload {
                    self.tableView.endPullRefreshing()
                }
            }
        }
        
        paginator.nextPageHandler = { [weak self] (error) in
            if let error = error {
                ULAAlert.showAlert(withText: error.localizedDescription, at: self)
            } else {
                let count = self?.usersDataSource.dataProvider.items.count ?? 0
                
                self?.tableView.beginUpdates()
                self?.usersDataSource.reload { [weak self] in
                    for index in count..<(self?.usersDataSource.dataProvider.items.count ?? 0) {
                        self?.tableView.insertRows(at: [IndexPath(row: index, section: 0)], with: .bottom)
                    }
                    self?.tableView.endUpdates()
                    self?.tableView.endPullRefreshing()
                }
            }
        }
        refreshIfNeeded()
    }
}

//MARK: - Help Metods
extension ULAUsersViewController {
    
    func refreshIfNeeded() {
        if self.usersDataSource.dataProvider.items.isEmpty {
            self.paginator.refreshList()
        }
    }
}
