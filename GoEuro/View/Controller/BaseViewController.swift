//
//  BaseViewController.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import UIKit
import NSObject_Rx

class BaseViewController: UIViewController {

    lazy var tableView: UITableView! = {
        var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 92
        tableView.register(R.nib.travelCell)
        tableView.separatorInset = .zero

        return tableView
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) { fatalError() }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        view.setNeedsUpdateConstraints()
    }

    override func updateViewConstraints() {
        NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: tableView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: tableView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0).isActive = true

        super.updateViewConstraints()
    }

}
