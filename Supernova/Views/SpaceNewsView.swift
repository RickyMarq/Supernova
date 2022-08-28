//
//  SpaceNewsView.swift
//  Supernova
//
//  Created by Henrique Marques on 22/08/22.
//

import UIKit
import SnapKit

class SpaceNewsView: UIView {

    lazy var newsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .black
        tableView.register(LargeSpaceNewsCell.self, forCellReuseIdentifier: LargeSpaceNewsCell.identifier)
        tableView.register(SpaceNewsCell.self, forCellReuseIdentifier: SpaceNewsCell.identifier)
        tableView.backgroundView = activity
        return tableView
    }()
    
    lazy var activity: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: .whiteLarge)
        activity.hidesWhenStopped = true
        activity.startAnimating()
        return activity
    }()
    
    public func setUpNewsTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.newsTableView.delegate = delegate
        self.newsTableView.dataSource = dataSource
    }
    
    private func setUpUIElements() {
        self.addSubview(self.newsTableView)
        self.addSubview(self.activity)
    }
    
    private func setUpUIConstraints() {
        self.setUpNewsTableViewConstraints()
    }
    
    private func setUpNewsTableViewConstraints() {
        self.newsTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpUIElements()
        self.setUpUIConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
