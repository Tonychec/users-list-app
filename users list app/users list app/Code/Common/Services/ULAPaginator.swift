//
//  ULAPaginator.swift
//  users list app
//
//  Created by iosNomad on 8/12/18.
//  Copyright © 2018 iosNomad. All rights reserved.
//

import UIKit
import SMPullToRefresh
import Alamofire
import Sync

class ULAPaginator {
    
    typealias ListTaskCreationHandler = (Int) -> DataRequest
    
    private(set) weak var tableView: UITableView?
    
    var isLoadData = false
    var nextPageHandler: ((_ result: Error?) -> Void)?
    var refreshListHandler: ((_ result: Error?) -> Void)?
    var automaticallyDisableNextPageLoading = true
    var automaticallyEndPullRefreshing = true
    var parser: (Any?) -> [[String: Any]]? = { value in
        return (value as! [String: Any])[ULAStrings.Pagination.results.rawValue] as? [[String: Any]]
    }
    
    var listTaskCreationHandler: ListTaskCreationHandler
    var entityName: String
    private var currentPage = 1

    init(withTableView tableView: UITableView, entityName: String, listTaskCreationHandler: @escaping ListTaskCreationHandler) {
        self.tableView = tableView
        self.listTaskCreationHandler = listTaskCreationHandler
        self.entityName = entityName

        addRefreshControlls()
    }

    deinit {
        tableView?.removeAllPullToRefresh()
    }

    private func addRefreshControlls() {
        tableView?.addPullToRefresh(PullToRefresh()) { [weak self] in
            self?.refreshList()
        }

        addBottomRefreshControll()
    }

    private func addBottomRefreshControll() {
        tableView?.addPullToRefresh(PullToRefresh(position: .bottom)) { [weak self] in
            self?.loadNextPage()
        }
    }

    @objc func refreshList() {
        currentPage = 1
        request(refreshAt: .top, handler: refreshListHandler, isNextPage: false)
    }

    private func loadNextPage() {
        currentPage += 1
        request(refreshAt: .bottom, handler: nextPageHandler, isNextPage: true)
    }

    func request(refreshAt: Position, handler: ((_ result: Error?) -> Void)?, isNextPage: Bool) {
        guard !isLoadData else {
            return
        }
        isLoadData = true
        tableView?.startRefreshing(at: refreshAt)
        listTaskCreationHandler(currentPage).responseJSON { [weak self] (task) in
            self?.isLoadData = false
            DispatchQueue.main.asyncAfter(deadline: .now() + kDefaultAnimationDuration) {
                guard let `self` = self else {
                    return
                }

                if self.automaticallyEndPullRefreshing {
                    self.tableView?.endRefreshing(at: refreshAt)
                }

                if let error = task.error {
                    handler?(error)
                } else {
                    let result = task.result
                    if self.tableView?.refresher(at: .bottom) == nil {
                        self.addBottomRefreshControll()
                    }

                    if let paginationJson = (result.value as! [String: Any])[ULAStrings.Pagination.pagination.rawValue] as? [String: Any],
                        let currentPage = paginationJson[ULAStrings.Pagination.currentPage.rawValue] as? Int{
                        self.currentPage = currentPage
                    } else {
                        fatalError(ULAStrings.Pagination.paginationError.rawValue)
                    }

                    if let itemsJson = self.parser(result.value) {
                        if isNextPage {
                            self.parse(items: itemsJson, operations: [.insert, .update], handler: self.nextPageHandler)
                        } else {
                            self.parse(items: itemsJson, operations: .all, handler: self.refreshListHandler)
                        }
                    }
                }
            }
        }
    }

    func parse(items: [[String : Any]], operations: Sync.OperationOptions, handler: ((_ result: Error?) -> Void)?) {
        Sync.changes(items, inEntityNamed: entityName, dataStack: ULADataStack.stack, operations: operations, completion: { (error) in
            handler?(error)
        })
    }
}
