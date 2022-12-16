//
//  ViewController.swift
//  Lesson 2
//
//  Created by Karina Kovaleva on 13.12.22.
//

import UIKit

class ViewController: UIViewController {
    
    var info: [Info] = []
    
    private let tableView: UITableView = {
        var tableView = UITableView()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        setupTableView()
        getInfo()
    }

    func setupTableView() {
        self.view.addSubview(tableView)
        tableView.frame = self.view.bounds
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func getInfo() {
        for _ in 1...100 {
            for n in 1...10 {
                info.append(Info(imageName: n, title: nil, description: nil))
            }
        }
        for (index, _) in info.enumerated() {
            info[index].title = "Title - \(index + 1)"
            info[index].description = "Description - \(index + 1)"
        }
    }

}
